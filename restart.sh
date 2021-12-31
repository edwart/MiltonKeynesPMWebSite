start_server --port=8300 --restart --daemonize --log-file=logs/server.log --status-file=logs/server.status --pid-file=logs/server.pid -- plackup -s Starman bin/app.psgi
