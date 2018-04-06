no strict; no warnings;

BEGIN { require './t/lib/ok.pl' }
use Text::Wrap;

print "1..1\n";

$huge='overflow';
$Text::Wrap::columns=9;
$break=".(?<=[,.])";
eval {
$a=$a=wrap('','',
"mmmm,n,ooo,ppp.qqqq.rrrrr.adsljasdf\nlasjdflajsdflajsdfljasdfl\nlasjdflasjdflasf,sssssssssssss,ttttttttt,uu,vvv wwwwwwwww####\n");
};

if ($@) {
	my $e = $@;
	$e =~ s/^/# /gm;
	print $e;
}
ok( !$@ );


