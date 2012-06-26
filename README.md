Minimal CGI Server for cgit
===========================

This is a python cgi server (server.py) just for serving cgit.

cgit is a web frontend for git repositories (http://hjemli.net/git/cgit/)

cgit.cgi is a precompiled mac 64-bit binary.

Before using, the scan-path in cgitrc usually need to be changed.

Ignore lighttpd.conf, Makefile and cgit.rb (for Homebrew https://github.com/mxcl/homebrew/)

Run
===

$ ./server.py

Open a browser and navigate to http://127.0.0.1:8000/

