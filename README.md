Minimal CGI Server for cgit
===========================

This is a python cgi server just for serving `cgit`. 
This is a fork of https://github.com/shyang/minimal-cgi-server-for-cgit to better support Python 2+ and to run on a Linux system

- cgit is a web frontend for git repositories (http://hjemli.net/git/cgit/)

* `cgit.cgi.linux_x86-64` is a precompiled Linux (Ubuntu Precise) 64-bit binary. *I used this one*
* `cgit.cgi.darwin_x86-64` is a precompiled Mach-O (Mac os x) 64-bit binary. *I did not test this one*
* Ignore lighttpd.conf, Makefile and cgit.rb (for Homebrew https://github.com/mxcl/homebrew/)
* Before using, the scan-path in `cgitrc` should be changed.


Run
===
- `$ ./server.py` for Python 3+
- `$ ./server-py2.py` for Python 2+

Open a browser and navigate to http://127.0.0.1:8000/


Notes
=====
- consider using https://gist.github.com/dweinstein/7552562 to setup your git project

