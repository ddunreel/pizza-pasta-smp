# Post-Reinstall Checklist

Steps to follow after reinstalling DietPi / PaperMC on the Raspberry Pi.

## 1. SSH Host Key

After a fresh OS install, the SSH host key changes. From your Mac:

```bash
ssh-keygen -R 192.168.30.28
```

Then reconnect — it will prompt to accept the new key.

## 2. Wait for Full Startup

PaperMC takes ~90 seconds to fully start on the Pi 400. Don't check `netstat` / `ss` too early — ports won't be bound until startup completes.

```bash
# Watch startup progress
sudo journalctl -u papermc -f

# Look for: Done (XXs)! For help, type "help"
```

## 3. Update Geyser and Floodgate

DietPi installs the bundled versions, which may be behind. Bedrock clients auto-update, so Geyser must match. Update immediately after reinstall:

```bash
# Update Geyser
wget -O /mnt/dietpi_userdata/papermc/plugins/Geyser-Spigot.jar \
  https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot

# Update Floodgate
wget -O /mnt/dietpi_userdata/papermc/plugins/floodgate-spigot.jar \
  https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot

# Restart server
sudo systemctl restart papermc
```

## 4. PaperMC Version

PaperMC itself is managed by DietPi (software ID 181). To update:

```bash
dietpi-software reinstall 181
```

Don't manually replace `/opt/papermc/paperclip.jar` unless necessary — let DietPi manage it.

## 5. Check server.properties

Key settings to verify after reinstall:

| Setting | Expected Value |
|---------|---------------|
| `online-mode` | `true` |
| `white-list` | `true` (if using whitelist) |
| `difficulty` | `easy` |
| `max-players` | `10` or desired |
| `rcon.password` | Set to a secure password |
| `enable-rcon` | `true` |

```bash
nano /mnt/dietpi_userdata/papermc/server.properties
```

## 6. Re-add Plugins

Plugins to reinstall (download JARs to `/mnt/dietpi_userdata/papermc/plugins/`):

- [ ] Geyser-Spigot (Bedrock bridge)
- [ ] Floodgate (Bedrock auth)
- [ ] ViaVersion (cross-version support)
- [ ] ProtocolLib
- [ ] Vault
- [ ] WeaponMechanics + MechanicsCore + packetevents
- [ ] QualityArmory
- [ ] SecretDoors

## 7. Whitelist Players

```bash
# Java players
/whitelist add <playername>

# Bedrock players (dot prefix from Floodgate)
/whitelist add .<bedrock_username>
```

## 8. Verify Ports

After server is fully started:

```bash
ss -tlnp | grep 25565   # Java Edition (TCP)
ss -ulnp | grep 19132   # Bedrock Edition (UDP)
ss -tlnp | grep 25575   # RCON (TCP)
```

## 9. Firewall

DietPi default has no firewall rules (all ACCEPT). Verify:

```bash
iptables -L -n
```

## 10. Test Connections

- [ ] Java Edition client can connect on port 25565
- [ ] Bedrock Edition (iPad/mobile) can connect on port 19132
- [ ] Web panel works at web-panel/index.html

If connections fail, see [DEBUGGING.md](DEBUGGING.md) for detailed troubleshooting steps.
