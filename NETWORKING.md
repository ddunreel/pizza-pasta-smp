# Network Setup

## Current Setup

The Pi is connected via **WiFi** (`wlan0`) to the `cmpdrvt` SSID on VLAN 30 (192.168.30.x). The router is a **UCG-Ultra**.

| Device | Interface | VLAN | IP |
|--------|-----------|------|----|
| Raspberry Pi 400 | wlan0 | 30 (cmpdrvt) | 192.168.30.28 |
| UCG-Ultra | br30 | 30 | 192.168.30.1 |
| UCG-Ultra | br10 | 10 (cmpdrvhm) | 192.168.10.1 |

## Cross-VLAN Server Discovery

Minecraft Java Edition LAN discovery uses UDP multicast to `224.0.2.60:4445` every 1.5s (via the **LANBroadcaster** plugin). This doesn't cross VLAN boundaries by default.

The UCG-Ultra's built-in mDNS reflector only handles `224.0.0.251:5353` — it cannot relay `224.0.2.60`. There is no native UniFi UI option for arbitrary multicast relay between VLANs.

Players on other VLANs can still connect by adding the server manually: IP `192.168.30.28`, port `25565`.

## Planned: Migrate to Ethernet + Multicast Relay

The Pi has an unused `eth0` port. Connecting it via a **trunk (802.1Q tagged) port** allows a single cable to carry multiple VLANs, and enables running `multicast-relay` on the Pi to forward LAN discovery packets across VLANs.

### Step 1: Configure trunk port on the switch

Tag VLANs 10 and 30 on the switch port connected to the Pi's `eth0`.

### Step 2: Configure VLAN sub-interfaces on the Pi

```bash
# Install vlan tools if needed
apt-get install -y vlan

# /etc/network/interfaces
auto eth0
iface eth0 inet manual

auto eth0.30
iface eth0.30 inet static
  address 192.168.30.28
  netmask 255.255.255.0
  gateway 192.168.30.1
  vlan-raw-device eth0

auto eth0.10
iface eth0.10 inet static
  address 192.168.10.X      # pick a free IP
  netmask 255.255.255.0
  vlan-raw-device eth0
```

Then bring them up:
```bash
ifup eth0.30
ifup eth0.10
```

### Step 3: Migrate server from wlan0 to eth0.30

In `/mnt/dietpi_userdata/papermc/server.properties`:
```
server-ip=192.168.30.28
```

Optionally disable wlan0 once ethernet is confirmed working:
```bash
ip link set wlan0 down
```

### Step 4: Install and run multicast-relay

```bash
# Install
git clone https://github.com/alsmith/multicast-relay /opt/multicast-relay
apt-get install -y python3-netifaces

# Test run
python3 /opt/multicast-relay/multicast-relay.py \
  --interfaces eth0.10 eth0.30 \
  --relay 224.0.2.60:4445 \
  --noMDNS --noSSDP
```

### Step 5: Persist as a systemd service

Create `/etc/systemd/system/multicast-relay.service`:

```ini
[Unit]
Description=Multicast Relay for Minecraft LAN discovery
After=network.target

[Service]
ExecStart=/usr/bin/python3 /opt/multicast-relay/multicast-relay.py \
  --interfaces eth0.10 eth0.30 \
  --relay 224.0.2.60:4445 \
  --noMDNS --noSSDP
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
```

```bash
systemctl daemon-reload
systemctl enable --now multicast-relay
```

### Why not on the UCG-Ultra?

Custom scripts on the UCG-Ultra are wiped on firmware updates unless stored in `/persistent` via `unifios-utilities`. Running it on the Pi (which has standard systemd and persists normally) is more reliable.
