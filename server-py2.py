#!/usr/bin/env python

import os

from CGIHTTPServer import CGIHTTPRequestHandler
from BaseHTTPServer import HTTPServer

os.environ['CGIT_CONFIG'] = 'cgitrc' # in current working directory

class RequestHandler(CGIHTTPRequestHandler):
    def is_cgi(self):
        cgi = '/cgit.cgi.linux_x86-64'
        self.cgi_info = cgi, self.path[len(cgi):] # setting the PATH_INFO correctly eliminates the need of URL rewriting
        return self.path == '/' or self.path.startswith(cgi)

port = 8000
httpd = HTTPServer(('', port), RequestHandler)

print 'start serving on port %d...' % port

try:
    httpd.serve_forever()
except KeyboardInterrupt:
    pass

