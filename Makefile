
start:
	CGIT_CONFIG=~/.cgitrc lighttpd -D -f lighttpd.conf &
	touch access.log && tail -f access.log

link:
	ln -svf `pwd`/cgit.rb /usr/local/Library/Formula/

