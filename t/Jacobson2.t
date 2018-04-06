use strict; use warnings;

use Text::Wrap;

print "1..1\n";

$Text::Wrap::huge='overflow';
$Text::Wrap::columns=9;
$Text::Wrap::break=".(?<=[,.])";
eval {
$a=$a=wrap('','',
"mmmm,n,ooo,ppp.qqqq.rrrrr.adsljasdf\nlasjdflajsdflajsdfljasdfl\nlasjdflasjdflasf,sssssssssssss,ttttttttt,uu,vvv wwwwwwwww####\n");
};

if ($@) {
	my $e = $@;
	$e =~ s/^/# /gm;
	print $e;
}
print $@ ? "not ok 1\n" : "ok 1\n";


