# Debugging Connection Issues

Troubleshooting guide for when players can't connect to the server.

## Quick Checks

### 1. Is the server running?

```bash
sudo systemctl status papermc
```

If stopped, start it and wait ~90 seconds for full startup:

```bash
sudo systemctl start papermc
sudo journalctl -u papermc -f
# Wait for: Done (XXs)! For help, type "help"
```

### 2. Are ports listening?

```bash
ss -tlnp | grep 25565   # Java Edition (TCP)
ss -ulnp | grep 19132   # Bedrock Edition (UDP)
ss -tlnp | grep 25575   # RCON (TCP)
```

### 3. Is there a firewall blocking traffic?

```bash
iptables -L -n
# DietPi default: all chains ACCEPT, no rules
```

## Bedrock Edition: "Multiplayer Connection Failed"

This is the most common issue. Follow these steps in order.

### Step 0: Check iOS Local Network permission (iPad/iPhone)

**This is the #1 cause.** iOS requires apps to have explicit Local Network access. Without it, Minecraft can discover servers via broadcast but cannot actually connect — pings work, connections fail, Featured Servers (internet) still work.

On the iPad/iPhone: **Settings → Privacy & Security → Local Network → Minecraft** → must be **ON**

### Step 1: Check server logs for connection attempts

```bash
sudo journalctl -u papermc --since "5 minutes ago" --no-pager | grep -i geyser
```

- **"has pinged you!"** = client can reach the server, but isn't connecting
- **No output at all** = client can't reach the server (network issue)
- **Connection/login messages** = client is connecting (issue is elsewhere)

### Step 2: Enable Geyser debug mode

Edit `/mnt/dietpi_userdata/papermc/plugins/Geyser-Spigot/config.yml`:

```yaml
debug-mode: true
```

Then restart: `sudo systemctl restart papermc`

This logs more detail about connection attempts and rejections.

### Step 3: Check the Bedrock protocol version

The most common cause of "pings but won't connect" is a **version mismatch**. Bedrock clients auto-update, and if the client version doesn't match the server's advertised protocol, it will ping but refuse to connect.

Query what version Geyser is advertising:

```bash
python3 -c "
import socket, struct, time

MAGIC = bytes([0x00, 0xff, 0xff, 0x00, 0xfe, 0xfe, 0xfe, 0xfe, 0xfd, 0xfd, 0xfd, 0xfd, 0x12, 0x34, 0x56, 0x78])

packet = bytearray()
packet.append(0x01)
packet += struct.pack('>q', int(time.time() * 1000))
packet += MAGIC
packet += struct.pack('>q', 2)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.settimeout(5)
sock.sendto(bytes(packet), ('127.0.0.1', 19132))

try:
    data, addr = sock.recvfrom(4096)
    motd_str = data[35:].decode('utf-8', errors='ignore')
    parts = motd_str.split(';')
    print(f'Edition:  {parts[0]}')
    print(f'MOTD:     {parts[1]}')
    print(f'Protocol: {parts[2]}')
    print(f'Version:  {parts[3]}')
    print(f'Players:  {parts[4]}/{parts[5]}')
    print(f'Mode:     {parts[8]}')
except socket.timeout:
    print('No response (timeout)')
finally:
    sock.close()
"
```

Example output:

```
Edition:  MCPE
MOTD:     A Minecraft Server
Protocol: 924
Version:  26.2
Players:  0/20
Mode:     Survival
```

**If the server's Version doesn't match the client's version**, the client won't connect. Fix by either:
- Updating the Bedrock client (App Store / Google Play / Microsoft Store)
- Updating Geyser to match the client version (see below)

### Step 4: Update Geyser and Floodgate

Bedrock auto-updates frequently. Geyser must keep up:

```bash
# Update Geyser
wget -O /mnt/dietpi_userdata/papermc/plugins/Geyser-Spigot.jar \
  https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot

# Update Floodgate
wget -O /mnt/dietpi_userdata/papermc/plugins/floodgate-spigot.jar \
  https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot

# Restart
sudo systemctl restart papermc
```

After updating, re-run the protocol version check (Step 3) and compare with the client version.

### Step 5: Capture network traffic

If logs don't show enough detail, use tcpdump. The Pi uses `wlan0` for WiFi:

```bash
# Capture all Bedrock traffic (use wlan0, NOT 'any')
tcpdump -i wlan0 -n 'udp port 19132' -c 50

# Filter by specific client IP
tcpdump -i wlan0 -n 'host <CLIENT_IP> and udp port 19132' -c 50
```

What to look for:
- **Only small packets (33 + 140 bytes)** = ping/pong only, client refuses to connect (version mismatch)
- **Larger packets after the pings** = connection attempt is happening, check server logs for errors
- **One-way traffic (no responses)** = server isn't responding, check if port is bound
- **Broadcast destination (192.168.30.255)** = client using LAN discovery, not direct connect

Install tcpdump if missing: `apt-get install -y tcpdump`

### Step 6: Check Geyser injection errors

Look for errors in the server log after startup:

```bash
cat /var/log/papermc/latest.log | grep -i -E 'error|warn|childHandler|inject'
```

If you see `NoSuchFieldException: childHandler`, Geyser's direct connection injection failed. Fix by disabling it in Geyser config:

```yaml
# In Geyser-Spigot/config.yml under advanced > java:
use-direct-connection: false
```

This has a minor performance cost but fixes injection compatibility issues with newer PaperMC versions.

## Bedrock Edition: Other Issues

### Client shows "Outdated Server" or "Outdated Client"

Version mismatch. See Step 3 above.

### Client connects but gets kicked immediately

Check if the player needs to be whitelisted:

```bash
# Java player
/whitelist add <playername>

# Bedrock player (Floodgate prefixes with a dot)
/whitelist add .<bedrock_username>
```

### Client connects but authentication fails

Verify Floodgate key is valid:

```bash
ls -la /mnt/dietpi_userdata/papermc/plugins/floodgate/key.pem
# Should be 16 bytes (AES key)
```

If missing or corrupt, delete and restart to regenerate:

```bash
rm /mnt/dietpi_userdata/papermc/plugins/floodgate/key.pem
sudo systemctl restart papermc
```

### Xbox/Microsoft account issues (iPad/mobile)

Bedrock players must:
- Be signed into their Microsoft/Xbox account
- Have multiplayer enabled in Xbox privacy settings (especially for child accounts)
- Not have the account restricted by Family Safety settings

## Java Edition: Can't Connect

### Check if the server is reachable

```bash
# From another machine on the network
nc -zv 192.168.30.28 25565
```

### "Authentication servers are currently not reachable"

This error appears on the **client**, not the server. The Minecraft client can't reach Mojang's auth servers. Common causes:

- **Parental controls / content filtering** blocking Mojang domains — whitelist `sessionserver.mojang.com`, `authserver.mojang.com`, and `api.mojang.com`
- **Restrictive VLAN** with outbound HTTPS blocked for non-whitelisted hosts
- **DNS issue** on the client machine

Verify the Pi can reach Mojang (server-side auth is separate):
```bash
curl -s -o /dev/null -w '%{http_code}' https://sessionserver.mojang.com/session/minecraft/hasJoined?username=test
# Should return 204
```

### Cross-VLAN connectivity

LAN server scanning uses UDP broadcast, which doesn't cross VLAN boundaries. Players on a different VLAN must add the server manually by IP (`192.168.30.28`). TCP port 25565 must be allowed through the router's inter-VLAN firewall rules.

For cross-VLAN LAN discovery, see [NETWORKING.md](NETWORKING.md).

### Check enforce-secure-profile

If Java clients get disconnected during login:

```bash
# In server.properties, try:
enforce-secure-profile=false
```

## Useful Log Commands

```bash
# Full log file
cat /var/log/papermc/latest.log

# Recent systemd logs
sudo journalctl -u papermc --since "1 hour ago" --no-pager

# Follow live logs
sudo journalctl -u papermc -f

# Filter for errors only
sudo journalctl -u papermc --since "1 hour ago" --no-pager | grep -i -E 'error|warn|fail'

# Filter for a specific player IP
sudo journalctl -u papermc --since "1 hour ago" --no-pager | grep '<PLAYER_IP>'
```
