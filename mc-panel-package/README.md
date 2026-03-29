# Minecraft Server Web Panel

A web-based control panel for managing your Minecraft server. View online players, manage bans, see player coordinates, playtime, kills/deaths, and more.

![Panel Preview](https://mc-heads.net/avatar/Steve/100)

## Features

- View online players with real-time coordinates
- See which dimension players are in (Overworld, Nether, End)
- Interactive minimap showing player positions
- Ban/unban players with custom reasons
- Temporary bans (requires EssentialsX plugin)
- View all players who have ever joined
- Player statistics: playtime, kills, deaths, K/D ratio
- BlueMap integration for 3D terrain view (optional)
- Auto-refresh every 10 seconds

## Requirements

### On your Minecraft Server:
- **Java Edition** Minecraft server (Paper, Spigot, Vanilla, etc.)
- **RCON enabled** in server.properties
- **Python 3.6+** installed
- (Optional) **EssentialsX** plugin for temporary bans
- (Optional) **BlueMap** plugin for 3D map view

### For the Web Panel:
- Any web browser
- Can be hosted on GitHub Pages, any web server, or just opened locally

## Setup Instructions

### Step 1: Configure Your Minecraft Server for RCON

Edit your `server.properties` file and set these values:

```properties
enable-rcon=true
rcon.port=25575
rcon.password=your-secure-password-here
```

Restart your Minecraft server after making these changes.

### Step 2: Set Up the API Server

1. Copy `mc-api-server.py` to your Minecraft server machine

2. Edit the configuration section at the top of the file:

```python
# RCON settings (must match your server.properties)
RCON_HOST = 'localhost'
RCON_PORT = 25575

# Path to your Minecraft server directory
SERVER_DIR = '/path/to/your/minecraft/server'

# Admin key for ban/unban (CHANGE THIS!)
ADMIN_KEY = 'your-secret-admin-key'

# Port for the API server
API_PORT = 8080
```

**Important paths by platform:**
| Platform | Example SERVER_DIR |
|----------|-------------------|
| Linux | `/home/minecraft/server` |
| Windows | `C:/MinecraftServer` |
| Raspberry Pi (DietPi) | `/mnt/dietpi_userdata/papermc` |

3. Run the API server:

```bash
# Linux/Mac
python3 mc-api-server.py

# Windows
python mc-api-server.py
```

### Step 3: Run API Server as a Service (Recommended)

To keep the API running even after you close the terminal:

#### Linux (systemd):

Create `/etc/systemd/system/mc-panel-api.service`:

```ini
[Unit]
Description=Minecraft Panel API Server
After=network.target

[Service]
Type=simple
User=root
WorkingDirectory=/path/to/api
ExecStart=/usr/bin/python3 /path/to/mc-api-server.py
Restart=always

[Install]
WantedBy=multi-user.target
```

Then run:
```bash
sudo systemctl daemon-reload
sudo systemctl enable mc-panel-api
sudo systemctl start mc-panel-api
```

#### Linux (simple background):

```bash
nohup python3 mc-api-server.py &
```

#### Windows:

Create a batch file `start-api.bat`:
```batch
@echo off
python mc-api-server.py
pause
```

Or use Task Scheduler to run it at startup.

### Step 4: Set Up the Web Panel

#### Option A: Open Locally
Just double-click `index.html` to open it in your browser.

#### Option B: Host on GitHub Pages
1. Create a new GitHub repository
2. Upload `index.html` to the repository
3. Go to Settings > Pages
4. Select "Deploy from a branch" and choose `main`
5. Your panel will be available at `https://yourusername.github.io/repo-name`

#### Option C: Host on Any Web Server
Upload `index.html` to your web server (Apache, Nginx, etc.)

### Step 5: Configure the Web Panel

1. Open the web panel in your browser
2. In the "Server Configuration" section:
   - **API Server URL**: Enter your server's IP and port (e.g., `http://192.168.1.100:8080`)
   - **Admin Key**: Enter the same key you set in `mc-api-server.py`
3. Click "Save & Connect"

The settings are saved in your browser's local storage.

## Firewall Configuration

Make sure these ports are accessible:

| Port | Protocol | Purpose |
|------|----------|---------|
| 8080 | TCP | API Server (or your custom port) |
| 25575 | TCP | RCON (only needs localhost access) |
| 8100 | TCP | BlueMap (optional, if using) |

For local network use only, you may need to allow port 8080 through your firewall:

```bash
# Linux (ufw)
sudo ufw allow 8080/tcp

# Linux (firewalld)
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
```

## Optional: BlueMap Integration

For the 3D map view feature:

1. Install the [BlueMap](https://github.com/BlueMap-Minecraft/BlueMap) plugin on your server
2. Configure BlueMap to run on port 8100 (default)
3. The web panel will automatically try to load BlueMap from your server

## API Endpoints

| Endpoint | Description |
|----------|-------------|
| `GET /api/status` | Server status and player count |
| `GET /api/players` | List of online players |
| `GET /api/allplayers` | All players who ever joined |
| `GET /api/positions` | Coordinates of all online players |
| `GET /api/banlist` | Current ban list |
| `GET /api/ban?key=KEY&player=NAME&reason=REASON` | Ban a player |
| `GET /api/unban?key=KEY&player=NAME` | Unban a player |
| `GET /api/tempban?key=KEY&player=NAME&duration=1d&reason=REASON` | Temp ban |
| `GET /api/player/position?name=NAME` | Get specific player position |

## Troubleshooting

### "Server Offline" but server is running
- Check that the API server is running
- Verify the API URL is correct (include `http://` and the port)
- Check firewall settings
- Test the API directly: `http://your-ip:8080/api/status`

### RCON connection errors
- Verify RCON is enabled in server.properties
- Check the RCON password matches
- Make sure the Minecraft server is running
- RCON port (25575) should be accessible from localhost

### Player list shows 0 but players are online
- This can happen with some server plugins that modify the `/list` command
- Check the API response at `/api/players` for debugging

### Ban/unban not working
- Verify the admin key matches between API and web panel
- Check the browser console for errors
- For temp bans, EssentialsX plugin must be installed

### Stats showing 0 for all players
- Stats are read from `world/stats/` folder
- Make sure SERVER_DIR is set correctly
- Players must have played for stats to be recorded

## Security Notes

- **Change the default admin key!** Anyone with the key can ban/unban players
- The API has no authentication beyond the admin key
- For public servers, consider adding additional security (reverse proxy with auth, VPN, etc.)
- Don't expose RCON port (25575) to the internet

## Credits

- Player avatars from [MC-Heads](https://mc-heads.net/)
- Built with vanilla HTML/CSS/JavaScript (no frameworks needed)

## License

MIT License - Feel free to modify and share!
