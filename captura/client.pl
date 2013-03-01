#!/usr/bin/env perl

use strict;
use warnings;
use IO::Socket::UNIX qw( SOCK_STREAM );

my $socket_path = '/tmp/digicheck2.socket';

my $socket = IO::Socket::UNIX->new(
   Type => SOCK_STREAM,
   Peer => $socket_path,
)
   or die("Can't connect to server: $!\n");

print $socket "Wibble\n";
chomp( my $line = <$socket> );
print qq{Server Sez "$line"\n};
