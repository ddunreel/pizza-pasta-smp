#!/usr/bin/env python3
from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import socket
import struct
import re
import os
import urllib.request
from urllib.parse import urlparse, parse_qs

# Plugins directory
PLUGINS_DIR = '/mnt/dietpi_userdata/papermc/plugins'

# RCON Configuration
RCON_HOST = 'localhost'
RCON_PORT = 25575

def get_rcon_password():
    try:
        with open('/mnt/dietpi_userdata/papermc/server.properties', 'r') as f:
            for line in f:
                if line.startswith('rcon.password='):
                    return line.split('=', 1)[1].strip()
    except:
        pass
    return ''

class RCONClient:
    def __init__(self, host, port, password):
        self.host = host
        self.port = port
        self.password = password
        self.socket = None
        self.request_id = 0

    def connect(self):
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.settimeout(5)
        self.socket.connect((self.host, self.port))
        return self._authenticate()

    def _authenticate(self):
        return self._send(3, self.password)

    def command(self, cmd):
        return self._send(2, cmd)

    def _send(self, ptype, payload):
        self.request_id += 1
        data = struct.pack('<ii', self.request_id, ptype) + payload.encode('utf-8') + b'\x00\x00'
        self.socket.send(struct.pack('<i', len(data)) + data)

        response_length = struct.unpack('<i', self.socket.recv(4))[0]
        response_data = self.socket.recv(response_length)
        response_id, response_type = struct.unpack('<ii', response_data[:8])
        response_body = response_data[8:-2].decode('utf-8')
        return response_body

    def close(self):
        if self.socket:
            self.socket.close()

def rcon_command(cmd):
    password = get_rcon_password()
    if not password:
        return {'error': 'RCON password not found'}
    try:
        client = RCONClient(RCON_HOST, RCON_PORT, password)
        client.connect()
        result = client.command(cmd)
        client.close()
        return {'success': True, 'response': result}
    except Exception as e:
        return {'error': str(e)}

def strip_color_codes(text):
    """Remove Minecraft color codes like §6, §c, §r, etc."""
    return re.sub(r'§[0-9a-fklmnor]', '', text)

def get_online_players():
    result = rcon_command('list')
    if 'error' in result:
        return result
    response = strip_color_codes(result.get('response', ''))
    # Match player count
    match = re.search(r'There are (\d+) (?:of a max(?:imum)? of|out of maximum) (\d+) players online', response, re.IGNORECASE)
    if match:
        online = int(match.group(1))
        max_players = int(match.group(2))
        players = []
        if online > 0:
            # Find player names - they come after "online." and a group name with ":"
            # Format: "...players online.default: player1, player2"
            # Or could be on newlines
            player_match = re.search(r'online[.:]?\s*(?:\w+:\s*)?(.+)$', response, re.IGNORECASE)
            if player_match:
                names_part = player_match.group(1)
                # Handle "groupname: player1, player2" format
                if ':' in names_part:
                    names_part = names_part.split(':')[-1]
                players = [p.strip() for p in names_part.split(',') if p.strip()]
        return {'online': online, 'max': max_players, 'players': players}
    return {'online': 0, 'max': 10, 'players': []}

def get_player_position(player):
    result = rcon_command(f'data get entity {player} Pos')
    if 'error' in result:
        return result
    response = result.get('response', '')
    match = re.search(r'\[(-?[\d.]+)d, (-?[\d.]+)d, (-?[\d.]+)d\]', response)
    if match:
        pos = {
            'player': player,
            'x': round(float(match.group(1))),
            'y': round(float(match.group(2))),
            'z': round(float(match.group(3)))
        }
        # Get dimension
        dim_result = rcon_command(f'data get entity {player} Dimension')
        if 'success' in dim_result:
            dim_response = dim_result.get('response', '')
            if 'the_nether' in dim_response:
                pos['dimension'] = 'nether'
            elif 'the_end' in dim_response:
                pos['dimension'] = 'end'
            else:
                pos['dimension'] = 'overworld'
        else:
            pos['dimension'] = 'overworld'
        return pos
    return {'player': player, 'error': 'Could not get position'}

def get_all_online_positions():
    """Get positions and dimensions for all online players"""
    online = get_online_players()
    if 'error' in online:
        return online
    positions = []
    for player in online.get('players', []):
        pos = get_player_position(player)
        if 'error' not in pos:
            positions.append(pos)
    return {'positions': positions}

def ban_player(player, reason='Banned via web panel'):
    return rcon_command(f'ban {player} {reason}')

def unban_player(player):
    return rcon_command(f'pardon {player}')

def tempban_player(player, duration, reason='Banned via web panel'):
    return rcon_command(f'tempban {player} {duration} {reason}')

def get_banlist():
    """Get ban list from banned-players.json for accurate parsing"""
    try:
        with open('/mnt/dietpi_userdata/papermc/banned-players.json', 'r') as f:
            bans = json.load(f)
        return {'bans': bans}
    except Exception as e:
        # Fallback to RCON
        result = rcon_command('banlist')
        if 'error' in result:
            return result
        return {'response': result.get('response', '')}

def get_player_stats(uuid):
    """Get player stats from stats file"""
    try:
        stats_file = f'/mnt/dietpi_userdata/papermc/world/stats/{uuid}.json'
        with open(stats_file, 'r') as f:
            stats = json.load(f)
        custom = stats.get('stats', {}).get('minecraft:custom', {})

        # Playtime (convert ticks to hours and minutes, 20 ticks = 1 second)
        ticks = custom.get('minecraft:play_time', 0)
        total_seconds = ticks // 20
        hours = total_seconds // 3600
        minutes = (total_seconds % 3600) // 60

        return {
            'playtime': {'hours': hours, 'minutes': minutes, 'total_seconds': total_seconds},
            'deaths': custom.get('minecraft:deaths', 0),
            'player_kills': custom.get('minecraft:player_kills', 0),
            'mob_kills': custom.get('minecraft:mob_kills', 0)
        }
    except:
        return {
            'playtime': {'hours': 0, 'minutes': 0, 'total_seconds': 0},
            'deaths': 0,
            'player_kills': 0,
            'mob_kills': 0
        }

def get_all_players():
    """Get all players who have ever joined from usercache.json"""
    try:
        with open('/mnt/dietpi_userdata/papermc/usercache.json', 'r') as f:
            players = json.load(f)
        # Get online players to mark status
        online_data = get_online_players()
        online_names = [p.lower() for p in online_data.get('players', [])]

        result = []
        for p in players:
            uuid = p.get('uuid', '')
            stats = get_player_stats(uuid)
            result.append({
                'name': p.get('name', 'Unknown'),
                'uuid': uuid,
                'lastSeen': p.get('expiresOn', '').replace(' +0000', ''),
                'online': p.get('name', '').lower() in online_names,
                'playtime': stats['playtime'],
                'deaths': stats['deaths'],
                'player_kills': stats['player_kills'],
                'mob_kills': stats['mob_kills']
            })
        return {'players': result}
    except Exception as e:
        return {'error': str(e), 'players': []}

# Admin key - CHANGE THIS!
ADMIN_KEY = 'mc-admin-2024-change-me'

def get_plugins():
    """Get list of installed plugins"""
    try:
        plugins = []
        for f in os.listdir(PLUGINS_DIR):
            if f.endswith('.jar'):
                filepath = os.path.join(PLUGINS_DIR, f)
                size = os.path.getsize(filepath)
                # Convert to human readable
                if size > 1024*1024:
                    size_str = f"{size/(1024*1024):.1f} MB"
                elif size > 1024:
                    size_str = f"{size/1024:.1f} KB"
                else:
                    size_str = f"{size} B"
                plugins.append({
                    'name': f,
                    'size': size_str,
                    'bytes': size
                })
        plugins.sort(key=lambda x: x['name'].lower())
        return {'plugins': plugins}
    except Exception as e:
        return {'error': str(e), 'plugins': []}

def delete_plugin(name):
    """Delete a plugin file"""
    try:
        # Security: only allow .jar files and no path traversal
        if '..' in name or '/' in name or '\\' in name:
            return {'error': 'Invalid plugin name'}
        if not name.endswith('.jar'):
            return {'error': 'Only .jar files can be deleted'}
        filepath = os.path.join(PLUGINS_DIR, name)
        if os.path.exists(filepath):
            os.remove(filepath)
            return {'success': True, 'message': f'Deleted {name}'}
        else:
            return {'error': 'Plugin not found'}
    except Exception as e:
        return {'error': str(e)}

def install_plugin(url):
    """Download and install a plugin from URL"""
    try:
        # Get filename from URL
        parsed = urlparse(url)
        filename = os.path.basename(parsed.path)
        if not filename.endswith('.jar'):
            # Try to get from content-disposition or add .jar
            filename = filename + '.jar' if filename else 'plugin.jar'

        # Security check
        if '..' in filename or '/' in filename or '\\' in filename:
            return {'error': 'Invalid filename'}

        filepath = os.path.join(PLUGINS_DIR, filename)

        # Download the file
        req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=60) as response:
            # Check for redirect filename in content-disposition
            cd = response.headers.get('Content-Disposition', '')
            if 'filename=' in cd:
                fn_match = re.search(r'filename=["\'"]?([^"\'\s;]+)', cd)
                if fn_match:
                    filename = fn_match.group(1)
                    if not filename.endswith('.jar'):
                        filename += '.jar'
                    filepath = os.path.join(PLUGINS_DIR, filename)

            with open(filepath, 'wb') as f:
                f.write(response.read())

        size = os.path.getsize(filepath)
        return {'success': True, 'message': f'Installed {filename}', 'filename': filename, 'size': size}
    except Exception as e:
        return {'error': str(e)}

class APIHandler(BaseHTTPRequestHandler):
    def _set_headers(self, status=200):
        self.send_response(status)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type, Authorization')
        self.end_headers()

    def do_OPTIONS(self):
        self._set_headers()

    def do_GET(self):
        parsed = urlparse(self.path)
        path = parsed.path
        params = parse_qs(parsed.query)

        if path == '/api/players':
            self._set_headers()
            self.wfile.write(json.dumps(get_online_players()).encode())

        elif path == '/api/player/position':
            player = params.get('name', [''])[0]
            if player:
                self._set_headers()
                self.wfile.write(json.dumps(get_player_position(player)).encode())
            else:
                self._set_headers(400)
                self.wfile.write(json.dumps({'error': 'Player name required'}).encode())

        elif path == '/api/banlist':
            self._set_headers()
            self.wfile.write(json.dumps(get_banlist()).encode())

        elif path == '/api/ban':
            key = params.get('key', [''])[0]
            player = params.get('player', [''])[0]
            reason = params.get('reason', ['Banned via web panel'])[0]
            if key == ADMIN_KEY and player:
                self._set_headers()
                self.wfile.write(json.dumps(ban_player(player, reason)).encode())
            else:
                self._set_headers(403)
                self.wfile.write(json.dumps({'error': 'Invalid key or player'}).encode())

        elif path == '/api/unban':
            key = params.get('key', [''])[0]
            player = params.get('player', [''])[0]
            if key == ADMIN_KEY and player:
                self._set_headers()
                self.wfile.write(json.dumps(unban_player(player)).encode())
            else:
                self._set_headers(403)
                self.wfile.write(json.dumps({'error': 'Invalid key or player'}).encode())

        elif path == '/api/tempban':
            key = params.get('key', [''])[0]
            player = params.get('player', [''])[0]
            duration = params.get('duration', ['1d'])[0]
            reason = params.get('reason', ['Banned via web panel'])[0]
            if key == ADMIN_KEY and player:
                self._set_headers()
                self.wfile.write(json.dumps(tempban_player(player, duration, reason)).encode())
            else:
                self._set_headers(403)
                self.wfile.write(json.dumps({'error': 'Invalid key or player'}).encode())

        elif path == '/api/status':
            self._set_headers()
            players = get_online_players()
            self.wfile.write(json.dumps({
                'server': 'online',
                'players': players
            }).encode())

        elif path == '/api/allplayers':
            self._set_headers()
            self.wfile.write(json.dumps(get_all_players()).encode())

        elif path == '/api/positions':
            self._set_headers()
            self.wfile.write(json.dumps(get_all_online_positions()).encode())

        elif path == '/api/plugins':
            self._set_headers()
            self.wfile.write(json.dumps(get_plugins()).encode())

        elif path == '/api/plugins/delete':
            key = params.get('key', [''])[0]
            name = params.get('name', [''])[0]
            if key == ADMIN_KEY and name:
                self._set_headers()
                self.wfile.write(json.dumps(delete_plugin(name)).encode())
            else:
                self._set_headers(403)
                self.wfile.write(json.dumps({'error': 'Invalid key or plugin name'}).encode())

        elif path == '/api/plugins/install':
            key = params.get('key', [''])[0]
            url = params.get('url', [''])[0]
            if key == ADMIN_KEY and url:
                self._set_headers()
                self.wfile.write(json.dumps(install_plugin(url)).encode())
            else:
                self._set_headers(403)
                self.wfile.write(json.dumps({'error': 'Invalid key or URL'}).encode())

        elif path == '/api/server/reload':
            key = params.get('key', [''])[0]
            if key == ADMIN_KEY:
                self._set_headers()
                self.wfile.write(json.dumps(rcon_command('reload confirm')).encode())
            else:
                self._set_headers(403)
                self.wfile.write(json.dumps({'error': 'Invalid key'}).encode())

        else:
            self._set_headers(404)
            self.wfile.write(json.dumps({'error': 'Not found'}).encode())

    def log_message(self, format, *args):
        pass

def run(port=8080):
    server = HTTPServer(('0.0.0.0', port), APIHandler)
    print(f'Starting MC API server on port {port}')
    server.serve_forever()

if __name__ == '__main__':
    run()
