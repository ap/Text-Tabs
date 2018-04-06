use strict; use warnings;
my $_t;
sub _ok { ( $_[0] ? 'ok ' : 'not ok ' ) . ++$_t . ( $_[1] ? " - $_[1]\n" : "\n" ) }
1;
