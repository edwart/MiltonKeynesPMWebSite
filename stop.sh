sudo /usr/local/bin/start_server --port=80 --stop --log-file=logs/server.log --status-file=logs/server.status --pid-file=logs/server.pid -- /usr/local/bin/plackup -s Starman bin/app.psgi
