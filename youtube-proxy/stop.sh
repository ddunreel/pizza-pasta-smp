#!/bin/bash
# Stop the YouTube proxy

PID_FILE="/tmp/mc-proxy.pid"
PROXY_PID_FILE="/tmp/mc-socks-proxy.pid"

if [ -f "$PID_FILE" ]; then
    kill "$(cat "$PID_FILE")" 2>/dev/null
    rm -f "$PID_FILE"
fi

if [ -f "$PROXY_PID_FILE" ]; then
    kill "$(cat "$PROXY_PID_FILE")" 2>/dev/null
    rm -f "$PROXY_PID_FILE"
fi

# Fallback cleanup
pkill -f "proxy.py 9090" 2>/dev/null
pkill -f "ssh -L 1080:localhost:9090" 2>/dev/null

echo "Proxy stopped."
