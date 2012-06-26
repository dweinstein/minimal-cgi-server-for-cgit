#! /usr/bin/env python3

import os

from http.server import HTTPServer, CGIHTTPRequestHandler

os.environ['CGIT_CONFIG'] = 'cgitrc' # in current working directory

class RequestHandler(CGIHTTPRequestHandler):
    def is_cgi(self):
        cgi = '/cgit.cgi'
        self.cgi_info = cgi, self.path[len(cgi):] # setting the PATH_INFO correctly eliminates the need of URL rewriting
        return self.path == '/' or self.path.startswith(cgi)

port = 8000
httpd = HTTPServer(('127.0.0.1', port), RequestHandler)

print('start serving on port %d...' % port)

try:
    httpd.serve_forever()
except KeyboardInterrupt:
    pass

