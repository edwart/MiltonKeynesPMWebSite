sudo /usr/local/bin/start_server --port=80 --restart --daemonize --log-file=logs/server.log --status-file=logs/server.status --pid-file=logs/server.pid -- /usr/local/bin/plackup -s Starman bin/app.psgi
