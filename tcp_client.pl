#!/usr/bin/perl

use IO::Socket;

$sock = new IO::Socket::INET(PeerAddr=>'localhost',
		PeerPort=>12345,
		Proto=>'tcp');

die "IO::Socket : $!" unless $sock;

print <$sock>;

close($sock);