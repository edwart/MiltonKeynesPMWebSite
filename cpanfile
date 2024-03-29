requires "Dancer2"                       => "0.160000";
requires "DateTime"                      => "1.19";
requires "Lingua::EN::Numbers::Ordinate" => "1.02";
requires "Server::Starter" 				 => "0.35";
requires "Plack::Handler::Starman" 		 => "0";
requires "Net::Server::SS::PreFork" 	 => "0";
requires "IO::Socket::SSL" 	 => "0";

recommends "YAML"             => "0";
recommends "URL::Encode::XS"  => "0";
recommends "CGI::Deurl::XS"   => "0";
recommends "HTTP::Parser::XS" => "0";

on "test" => sub {
    requires "Test::More"            => "0";
    requires "HTTP::Request::Common" => "0";
};
