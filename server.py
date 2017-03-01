#!/usr/bin/env python
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer


class S(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/text')
        self.end_headers()
        self.wfile.write("hello")


httpd = HTTPServer(('', 8000), S)
httpd.serve_forever()
