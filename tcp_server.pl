use IO::Socket;
use strict;

my $sock0;
my $sock;

$sock0 = new IO::Socket::INET(Listen=>5,
	LocalAddr=>'localhost',
	LocalPort=>12345,
	Proto=>'tcp',
	Reuse=>1);

die "IO::Socket : $!" unless $sock0;

$sock = $sock0->accept();

print $sock "HELLO\n";

close($sock);
close($sock0);

exit;