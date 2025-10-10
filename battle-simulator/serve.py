#!/usr/bin/env python3
"""
Simple HTTP server for the battle simulator
"""

import http.server
import socketserver
import os

PORT = 8000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        # Enable CORS
        self.send_header('Access-Control-Allow-Origin', '*')
        super().end_headers()

os.chdir(os.path.dirname(os.path.abspath(__file__)))

with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
    print(f"Pokemon Battle Simulator")
    print(f"Serving at http://localhost:{PORT}")
    print(f"Open http://localhost:{PORT}/index.html in your browser")
    print(f"Press Ctrl+C to stop the server")
    httpd.serve_forever()
