use IO::Socket;
use strict;

my $sock0;
my $sock;

my $local_port = $ARGV[0];

$sock0 = new IO::Socket::INET(Listen=>5,
	LocalAddr=>'localhost',
	LocalPort=>$local_port,
	Proto=>'tcp',
	Reuse=>1);

die "IO::Socket : $!" unless $sock0;

$sock = $sock0->accept();

print $sock "HELLO\n";

close($sock);
close($sock0);

exit;