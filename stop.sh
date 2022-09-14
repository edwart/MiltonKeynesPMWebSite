#!/usr/bin/bash
cd /var/www/html/MiltonKeynesPMWebSite
PATH=/home/tony/perl5/perlbrew/perls/perl-5.34.0/bin:$PATH
PORT=8300
start_server --port=$PORT --stop --log-file=logs/server.log --status-file=logs/server.status --pid-file=logs/server.pid -- plackup -s Starman bin/app.psgi
