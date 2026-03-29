#!/usr/bin/env python3
"""
Minecraft Server Web Panel - API Server
========================================
This API server connects to your Minecraft server via RCON and provides
endpoints for the web panel to manage players, bans, and view statistics.

Configure the settings below before running.
"""

from http.server import HTTPServer, BaseHTTPRequestHandler
import json
import socket
import struct
import re
import os
from urllib.parse import urlparse, parse_qs

# =============================================================================
# CONFIGURATION - EDIT THESE VALUES FOR YOUR SERVER
# =============================================================================

# RCON settings (must match your server.properties)
RCON_HOST = 'localhost'
RCON_PORT = 25575

# Path to your Minecraft server directory (where server.properties is located)
# Examples:
#   Linux: '/home/minecraft/server'
#   Windows: 'C:/MinecraftServer'
#   Raspberry Pi with DietPi: '/mnt/dietpi_userdata/papermc'
SERVER_DIR = '/mnt/dietpi_userdata/papermc'

# Admin key for ban/unban operations (CHANGE THIS TO SOMETHING SECURE!)
# This key must match what you enter in the web panel
ADMIN_KEY = 'change-me-to-something-secure'

# Port for this API server (default: 8080)
API_PORT = 8080

# =============================================================================
# END CONFIGURATION
# =============================================================================

def get_rcon_password():
    """Read RCON password from server.properties"""
    try:
        props_file = os.path.join(SERVER_DIR, 'server.properties')
        with open(props_file, 'r') as f:
            for line in f:
                if line.startswith('rcon.password='):
                    return line.split('=', 1)[1].strip()
    except Exception as e:
        print(f"Warning: Could not read RCON password: {e}")
    return ''

class RCONClient:
    """Simple RCON client for Minecraft server communication"""

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
    """Execute an RCON command and return the result"""
    password = get_rcon_password()
    if not password:
        return {'error': 'RCON password not found in server.properties'}
    try:
        client = RCONClient(RCON_HOST, RCON_PORT, password)
        client.connect()
        result = client.command(cmd)
        client.close()
        return {'success': True, 'response': result}
    except Exception as e:
        return {'error': str(e)}

def strip_color_codes(text):
    """Remove Minecraft color codes like S6, Sc, Sr, etc."""
    return re.sub(r'§[0-9a-fklmnor]', '', text)

def get_online_players():
    """Get list of currently online players"""
    result = rcon_command('list')
    if 'error' in result:
        return result
    response = strip_color_codes(result.get('response', ''))

    # Match player count from various server formats
    match = re.search(r'There are (\d+) (?:of a max(?:imum)? of|out of maximum) (\d+) players online', response, re.IGNORECASE)
    if match:
        online = int(match.group(1))
        max_players = int(match.group(2))
        players = []
        if online > 0:
            # Find player names after "online" text
            player_match = re.search(r'online[.:]?\s*(?:\w+:\s*)?(.+)$', response, re.IGNORECASE)
            if player_match:
                names_part = player_match.group(1)
                if ':' in names_part:
                    names_part = names_part.split(':')[-1]
                players = [p.strip() for p in names_part.split(',') if p.strip()]
        return {'online': online, 'max': max_players, 'players': players}
    return {'online': 0, 'max': 10, 'players': []}

def get_player_position(player):
    """Get a player's current position and dimension"""
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
    """Permanently ban a player"""
    return rcon_command(f'ban {player} {reason}')

def unban_player(player):
    """Unban (pardon) a player"""
    return rcon_command(f'pardon {player}')

def tempban_player(player, duration, reason='Banned via web panel'):
    """Temporarily ban a player (requires EssentialsX plugin)"""
    return rcon_command(f'tempban {player} {duration} {reason}')

def get_banlist():
    """Get ban list from banned-players.json"""
    try:
        ban_file = os.path.join(SERVER_DIR, 'banned-players.json')
        with open(ban_file, 'r') as f:
            bans = json.load(f)
        return {'bans': bans}
    except Exception as e:
        # Fallback to RCON
        result = rcon_command('banlist')
        if 'error' in result:
            return result
        return {'response': result.get('response', '')}

def get_player_stats(uuid):
    """Get player statistics from Minecraft stats files"""
    try:
        stats_file = os.path.join(SERVER_DIR, 'world', 'stats', f'{uuid}.json')
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
        cache_file = os.path.join(SERVER_DIR, 'usercache.json')
        with open(cache_file, 'r') as f:
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

class APIHandler(BaseHTTPRequestHandler):
    """HTTP request handler for the API endpoints"""

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

        else:
            self._set_headers(404)
            self.wfile.write(json.dumps({'error': 'Not found'}).encode())

    def log_message(self, format, *args):
        # Suppress default logging (comment this out if you want to see requests)
        pass

def run(port=API_PORT):
    """Start the API server"""
    server = HTTPServer(('0.0.0.0', port), APIHandler)
    print(f'Minecraft Panel API Server')
    print(f'==========================')
    print(f'Server directory: {SERVER_DIR}')
    print(f'RCON: {RCON_HOST}:{RCON_PORT}')
    print(f'API running on: http://0.0.0.0:{port}')
    print(f'')
    print(f'Endpoints:')
    print(f'  GET /api/status      - Server status and online players')
    print(f'  GET /api/players     - Online player list')
    print(f'  GET /api/allplayers  - All players who ever joined')
    print(f'  GET /api/positions   - All online player positions')
    print(f'  GET /api/banlist     - Current ban list')
    print(f'  GET /api/ban         - Ban a player (requires key)')
    print(f'  GET /api/unban       - Unban a player (requires key)')
    print(f'  GET /api/tempban     - Temp ban (requires EssentialsX)')
    print(f'')
    print(f'Press Ctrl+C to stop')
    server.serve_forever()

if __name__ == '__main__':
    run()
