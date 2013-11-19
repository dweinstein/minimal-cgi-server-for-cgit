Minimal CGI Server for cgit
===========================

This is a python cgi server (server.py) just for serving cgit.

cgit is a web frontend for git repositories (http://hjemli.net/git/cgit/)

`cgit.cgi.linux_x86-64` is a precompiled Linux (Ubuntu Precise) 64-bit binary.

`cgit.cgi.darwin_x86-64` is a precompiled Mach-O (Mac os x) 64-bit binary. *I did not test this one*

* Before using, the scan-path in cgitrc usually need to be changed.

* Ignore lighttpd.conf, Makefile and cgit.rb (for Homebrew https://github.com/mxcl/homebrew/)

Run
===

$ ./server.py

Open a browser and navigate to http://127.0.0.1:8000/


Notes
=====
- consider using https://gist.github.com/dweinstein/7552562 to setup your git project

