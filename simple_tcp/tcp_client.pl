#!/usr/bin/perl

use IO::Socket;

my $target_ip = $ARGV[0];
my $target_port = $ARGV[1];


my $sock = new IO::Socket::INET(PeerAddr=>$target_ip,
		PeerPort=>$target_port,
		Proto=>'tcp');

die "IO::Socket : $!" unless $sock;

print <$sock>;

close($sock);