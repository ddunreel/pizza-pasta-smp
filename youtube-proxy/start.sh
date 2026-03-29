#!/bin/bash
# YouTube via Minecraft Server Proxy
# Chain: Chrome -> Pi (bounce) -> Mac -> YouTube
# Traffic physically travels through the Pi!

SERVER="root@192.168.30.28"
LOCAL_PROXY_PORT=9090
REMOTE_PROXY_PORT=9090
BROWSER_PORT=1080
PID_FILE="/tmp/mc-proxy.pid"
PROXY_PID_FILE="/tmp/mc-socks-proxy.pid"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Clean up any existing sessions
"$SCRIPT_DIR/stop.sh" 2>/dev/null

echo "[1/3] Starting local SOCKS5 proxy on port $LOCAL_PROXY_PORT..."
python3 "$SCRIPT_DIR/proxy.py" "$LOCAL_PROXY_PORT" &
PROXY_PID=$!
echo "$PROXY_PID" > "$PROXY_PID_FILE"
sleep 1

if ! kill -0 "$PROXY_PID" 2>/dev/null; then
    echo "Failed to start local proxy."
    exit 1
fi
echo "      Local proxy running (PID $PROXY_PID)"

echo "[2/3] Creating reverse tunnel through Minecraft server..."
# -R: Makes Mac's proxy available on Pi as localhost:9090
# -L: Forwards Mac:1080 -> Pi:9090 (so Chrome can use it)
# The chain: Chrome:1080 -> tunnel to Pi:9090 -> reverse tunnel -> Mac:9090 -> internet
ssh -L "$BROWSER_PORT:localhost:$REMOTE_PROXY_PORT" \
    -R "$REMOTE_PROXY_PORT:localhost:$LOCAL_PROXY_PORT" \
    -f -C -N "$SERVER"

if [ $? -ne 0 ]; then
    echo "Failed to connect to Minecraft server."
    kill "$PROXY_PID" 2>/dev/null
    exit 1
fi

pgrep -f "ssh -L $BROWSER_PORT:localhost:$REMOTE_PROXY_PORT" > "$PID_FILE"
echo "      Tunnel established!"

echo "[3/3] Opening Chrome with proxy..."
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    --proxy-server="socks5://localhost:$BROWSER_PORT" \
    --user-data-dir="/tmp/mc-proxy-chrome" \
    --no-first-run \
    "https://www.youtube.com" &

echo ""
echo "Done! Traffic path: Chrome -> Pi -> Mac -> YouTube"
echo "Run ./stop.sh when done."
