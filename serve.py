#!/usr/bin/env python3
"""
Simple HTTP Server for Smart Time & Wellness Frontend
Serves the webapp directory on port 8080
"""

import http.server
import socketserver
import os

# Change to webapp directory
webapp_dir = os.path.join(os.path.dirname(__file__), 'src', 'main', 'webapp')
os.chdir(webapp_dir)

PORT = 8080
Handler = http.server.SimpleHTTPRequestHandler

print("=" * 50)
print("  SMART TIME & WELLNESS - DEV SERVER")
print("=" * 50)
print()
print(f"Starting server at: http://localhost:{PORT}/")
print(f"Serving directory: {webapp_dir}")
print()
print("Available pages:")
print("  • http://localhost:8080/")
print("  • http://localhost:8080/login.html")
print("  • http://localhost:8080/register.html")
print("  • http://localhost:8080/user/dashboard.html")
print("  • http://localhost:8080/admin/dashboard.html")
print()
print("Press Ctrl+C to stop the server")
print("=" * 50)
print()

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n\nServer stopped.")
        httpd.shutdown()
