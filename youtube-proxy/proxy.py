#!/usr/bin/env python3
"""Lightweight SOCKS5 proxy server (no auth, no dependencies)."""

import socket
import select
import struct
import threading
import sys

LISTEN_PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 9090
BUFFER_SIZE = 8192


def handle_client(client_sock):
    try:
        # SOCKS5 greeting
        data = client_sock.recv(262)
        if not data or data[0] != 0x05:
            client_sock.close()
            return
        # No auth required
        client_sock.sendall(b"\x05\x00")

        # SOCKS5 request
        data = client_sock.recv(4)
        if not data or len(data) < 4:
            client_sock.close()
            return
        ver, cmd, _, atyp = struct.unpack("!BBBB", data)
        if cmd != 0x01:  # only CONNECT
            client_sock.sendall(b"\x05\x07\x00\x01" + b"\x00" * 6)
            client_sock.close()
            return

        if atyp == 0x01:  # IPv4
            addr = socket.inet_ntoa(client_sock.recv(4))
        elif atyp == 0x03:  # Domain
            domain_len = client_sock.recv(1)[0]
            addr = client_sock.recv(domain_len).decode()
        elif atyp == 0x04:  # IPv6
            addr = socket.inet_ntop(socket.AF_INET6, client_sock.recv(16))
        else:
            client_sock.close()
            return

        port = struct.unpack("!H", client_sock.recv(2))[0]

        # Connect to target
        remote_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        remote_sock.settimeout(15)
        try:
            remote_sock.connect((addr, port))
        except Exception:
            client_sock.sendall(b"\x05\x05\x00\x01" + b"\x00" * 6)
            client_sock.close()
            return

        # Success
        bind = remote_sock.getsockname()
        reply = b"\x05\x00\x00\x01"
        reply += socket.inet_aton(bind[0])
        reply += struct.pack("!H", bind[1])
        client_sock.sendall(reply)

        # Relay data
        remote_sock.settimeout(None)
        while True:
            readable, _, _ = select.select([client_sock, remote_sock], [], [], 60)
            if not readable:
                break
            for sock in readable:
                data = sock.recv(BUFFER_SIZE)
                if not data:
                    raise ConnectionError
                target = remote_sock if sock is client_sock else client_sock
                target.sendall(data)
    except Exception:
        pass
    finally:
        client_sock.close()
        try:
            remote_sock.close()
        except Exception:
            pass


def main():
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind(("127.0.0.1", LISTEN_PORT))
    server.listen(128)
    print(f"SOCKS5 proxy listening on 127.0.0.1:{LISTEN_PORT}")
    while True:
        client, _ = server.accept()
        threading.Thread(target=handle_client, args=(client,), daemon=True).start()


if __name__ == "__main__":
    main()
