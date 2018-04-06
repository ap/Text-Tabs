no strict; no warnings;

BEGIN { require './t/lib/ok.pl' }
use Text::Wrap;

print "1..2\n";

$Text::Wrap::columns = 4;
eval { $x = Text::Wrap::wrap('', '123', 'some text'); };
ok(!$@);
ok($x eq "some\n123t\n123e\n123x\n123t");

