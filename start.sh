#/home/tony/perl5/perlbrew/perls/perl-5.34.0/bin/start_server --port=443 --daemonize --log-file=logs/server.log --status-file=logs/server.status --pid-file=logs/server.pid -- plackup -s Starman --port=443 bin/app.psgi
PATH=/home/tony/perl5/perlbrew/perls/perl-5.34.0/bin:$PATH
PORT=8300
SSLKEY=/etc/letsencrypt/live/miltonkeynes.pm/privkey.pem
SSLCERT=/etc/letsencrypt/live/miltonkeynes.pm/cert.pem

#plackup -p $PORT --ssl --ssl-key-file=$SSLKEY --ssl-cert-file=$SSLCERT bin/app.psgi
#start_server --port=$PORT --daemonize --log-file=logs/server.log --status-file=logs/server.status --pid-file=logs/server.pid -- plackup --ssl --ssl-key-file=$SSLKEY --ssl-cert-file=$SSLCERT -s Starman --enable-ssl --ssl-key-file=$SSLKEY --ssl-cert-file=$SSLCERT --listen=$PORT:ssl bin/app.psgi
start_server --port=$PORT --daemonize --log-file=logs/server.log --status-file=logs/server.status --pid-file=logs/server.pid -- plackup -s Starman  --port=$PORT bin/app.psgi

