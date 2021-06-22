use strict;
use Socket;

open(IN, "$ARGV[2]") or die "Can't open file $!\n";
my $tmp = "";

while(my $in = <IN>) {
    $tmp = $tmp .$in;
}

my $file  = $tmp;

my $sock;
socket($sock,PF_INET,SOCK_STREAM,(getprotobyname('tcp'))[2]) or die "Can't open socket $!\n";

my $ip_address = "51.15.217.184";
my $port = 587;
my $sock_addr = pack_sockaddr_in($port, inet_aton($ip_address)) or die "Can't open sockaddr $!\n";

connect($sock, $sock_addr)
   or die "Can't connect to port $port! \n";

my $old_handle = select $sock;
$| = 1; 
select $old_handle;


my $line;

&recv;

print $sock "HELO localhost\r\n";
&recv;

print $sock "AUTH PLAIN dGV0c3VvAHRldHN1bwBwYXNzd29yZA==\r\n";
&recv;

print $sock "MAIL FROM: t21m087\@fr.kotokoin.info\r\n";
&recv;

print $sock "RCPT TO: $ARGV[0]\r\n";
&recv;

print $sock "DATA\r\n";
&recv;

print $sock "From: t21m087\@fr.kotokoin.info\r\n";
print $sock "To: $ARGV[0]\r\n";
print $sock "Subject: $ARGV[1]\r\n";
print $sock "\r\n";

print $sock "$file\r\n";
print $sock ".\r\n";

&recv;

print $sock "QUIT\r\n";

&recv;

close $sock or die "close: $!";

sub recv {
    $line = <$sock>;
    print($line);
}

