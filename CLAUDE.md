# Minecraft Server Documentation

PaperMC Minecraft server running on a Raspberry Pi 400 with DietPi OS.

## Server Access

```bash
# Via VLAN 30 (IoT) - ethernet
ssh root@192.168.30.27

# Via VLAN 10 (Home) - ethernet tagged
ssh root@192.168.10.28

# Via VLAN 30 (IoT) - WiFi fallback
ssh root@192.168.30.28
```

Uses SSH key authentication (no password required).

## Webpanel

Open the webpanel at:
```
web-panel/index.html
```

Features:
- Player positions map (Overworld, Nether, The End)
- Plugin Manager to install plugins via URL
- Player list with stats and ban controls

## Server Management Commands

```bash
# Check server status
sudo systemctl status papermc

# Start the server
sudo systemctl start papermc

# Stop the server
sudo systemctl stop papermc

# Restart the server
sudo systemctl restart papermc

# View live logs
sudo journalctl -u papermc -f
```

## Key Directories

| Path | Description |
|------|-------------|
| `/mnt/dietpi_userdata/papermc/` | Server data (worlds, configs, plugins) |
| `/opt/papermc/paperclip.jar` | PaperMC server JAR |
| `/var/log/papermc/` | Server logs |
| `/mnt/dietpi_userdata/papermc/plugins/` | Installed plugins |
| `/mnt/dietpi_userdata/papermc/server.properties` | Main server configuration |

## Server Specifications

- **Server Software**: PaperMC 1.21.11
- **Java**: OpenJDK Temurin 21.0.9 (ARM64)
- **RAM**: 3.8GB system total, 2.5GB allocated to Minecraft (`-mx2560m`)
- **Java Port**: 25565 (default)
- **Bedrock Port**: 19132
- **RCON Port**: 25575
- **Max Players**: 10
- **Difficulty**: Easy
- **Whitelist**: Enabled

## Network / VLAN Setup

The Pi spans two VLANs via 802.1Q tagging on ethernet, plus WiFi as fallback:

| Interface | VLAN | Subnet | IP (DHCP) | Role |
|-----------|------|--------|-----------|------|
| `eth0` | 30 (IoT) - native/untagged | `192.168.30.0/24` | `192.168.30.27` | Default route, primary MC access |
| `eth0.10` | 10 (Home) - tagged | `192.168.10.0/24` | `192.168.10.28` | LAN discovery for Home network |
| `wlan0` | 30 (IoT) | `192.168.30.0/24` | `192.168.30.28` | Fallback access |

### Key config files
- `/etc/network/interfaces` - VLAN interface definitions
- `/etc/network/interfaces.bak` - Pre-VLAN backup
- `/etc/modules` - Loads `8021q` kernel module at boot

### Multicast LAN Discovery Relay

Minecraft Java announces LAN games via multicast (`224.0.2.60:4445`), which doesn't cross VLAN boundaries. A Python relay service re-broadcasts announcements from eth0 (VLAN 30) to eth0.10 (VLAN 10).

- **Script**: `/usr/local/bin/mc-multicast-relay.py`
- **Service**: `mc-multicast-relay.service` (enabled, starts on boot)

```bash
# Check relay status
sudo systemctl status mc-multicast-relay

# Restart relay
sudo systemctl restart mc-multicast-relay
```

### Switch port config
The ethernet port on the switch must be configured as:
- **Native/untagged VLAN**: 30 (IoT)
- **Tagged VLAN**: 10 (Home)

## Installed Plugins

| Plugin | Purpose |
|--------|---------|
| Geyser-Spigot | Allows Bedrock Edition clients to connect |
| Floodgate | Handles Bedrock player authentication without Java accounts |
| ViaVersion | Allows clients on different Minecraft versions to connect |
| ProtocolLib | Library for reading/modifying packets |
| QualityArmory | Adds guns and weapons |
| Vault | Economy/permissions API for plugins |
| **WeaponMechanics** | Advanced tactical gun system (TACZ-style) |
| MechanicsCore | Required library for WeaponMechanics |
| packetevents | Required library for WeaponMechanics |
| **SecretDoors** | Hidden doors behind blocks |

## WeaponMechanics - Tactical Guns

### Give Weapons
```bash
/wm give <player> <weapon_name>
```

### Available Weapons (TACZ-Style Tactical)

**Assault Rifles:**
- `HK416` - 5.56mm, semi/full-auto, low recoil
- `SCAR_H` - 7.62mm battle rifle, high damage
- `AK_47` - 7.62mm Soviet, high recoil
- `M4A1` - 5.56mm, balanced
- `FN_FAL` - 7.62mm NATO

**SMGs:**
- `MP5` - 9mm, accurate, 3 fire modes
- `Vector` - .45 ACP, ultra-high fire rate
- `Uzi` - 9mm classic
- `AUG` - Bullpup SMG

**Sniper Rifles:**
- `AWP` - .338 Lapua, bolt-action, one-shot potential
- `AX_50` - .50 BMG heavy sniper
- `Kar98k` - WW2 bolt-action

**Pistols:**
- `Glock_17` - 9mm, fast, 17 rounds
- `M1911` - .45 ACP, heavy hitting
- `357_Magnum` - Revolver
- `50_GS` - Desert Eagle

**Shotguns:**
- `M870` - Pump-action, 8 pellets
- `Origin_12` - Auto shotgun
- `R9_0` - Double barrel

**Explosives:**
- `RPG_7`, `Fatman`, `Grenade`, `Flashbang`, `Semtex`

### Controls
- **Right-Click**: Shoot
- **Left-Click**: Aim down sights (ADS)
- **Q (Drop)**: Reload
- **F (Swap hands)**: Change fire mode (Semi/Burst/Auto)

### Realistic Features
- Bullet drop and travel time
- Caliber-based damage (9mm < .45 < 5.56 < 7.62 < .338)
- Headshots deal +100% damage
- Recoil patterns per weapon
- Damage falloff over distance

## Architecture: Bedrock-Java Bridge

This server supports both Java Edition and Bedrock Edition players:

```
Bedrock Clients (mobile, console, Windows 10)
        |
        v
    Port 19132 (UDP)
        |
        v
    Geyser-Spigot (translates Bedrock protocol to Java)
        |
        v
    Floodgate (authenticates Bedrock players)
        |
        v
    PaperMC Server (Java Edition)
        ^
        |
    Port 25565 (TCP)
        |
Java Edition Clients
```

## Troubleshooting

See [DEBUGGING.md](DEBUGGING.md) for step-by-step guides to diagnose connection issues (Bedrock version mismatches, Geyser injection errors, network capture, etc).

## Common Tasks

### Whitelist a Player

```bash
# Connect to server console via RCON or edit whitelist.json
# Add Java player:
# In-game or console: /whitelist add <playername>

# For Bedrock players (prefixed with dot by Floodgate):
# /whitelist add .<bedrock_username>
```

### Give Operator Permissions

```bash
# In console or in-game with op permissions:
/op <playername>
```

### Check Recent Logs

```bash
# View latest log file
cat /var/log/papermc/latest.log

# Or use journalctl for systemd logs
sudo journalctl -u papermc --since "1 hour ago"
```

### Edit Server Properties

```bash
# Edit the main config
nano /mnt/dietpi_userdata/papermc/server.properties

# Restart server to apply changes
sudo systemctl restart papermc
```

### Plugin Configuration

Plugin configs are located at:
```
/mnt/dietpi_userdata/papermc/plugins/<PluginName>/config.yml
```

Key configs:
- Geyser: `/mnt/dietpi_userdata/papermc/plugins/Geyser-Spigot/config.yml`
- Floodgate: `/mnt/dietpi_userdata/papermc/plugins/floodgate/config.yml`
