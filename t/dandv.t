use strict; use warnings;

BEGIN { require './t/lib/ok.pl' }
use Text::Wrap;

print "1..2\n";

$Text::Wrap::columns = 4;
my $x;
my $ok = eval { $x = wrap('', '123', 'some text'); 1 };
ok( $ok, 'no exception thrown' );
ok( defined $x && $x eq "some\n123t\n123e\n123x\n123t", 'expected wrapping returned' );
