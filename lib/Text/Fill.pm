
package Text::Fill;

require Exporter;

@ISA = (Exporter);
@EXPORT = qw(fill);

$VERSION = 98.112801;

use Text::Wrap;
use strict;

sub fill 
{
	my ($ip, $xp, @raw) = @_;
	my @para;
	my $pp;

	for $pp (split(/\n\s+/, join("\n",@raw))) {
		$pp =~ s/\s+/ /g;
		my $x = wrap($ip, $xp, $pp);
		push(@para, $x);
	}

	# if paragraph_indent is the same as line_indent, 
	# separate paragraphs with blank lines

	return join ($ip eq $xp ? "\n\n" : "\n", @para);
}

1;
__END__

=head NAME

Text::Fill - wrap multiple paragraphs

=head1 SYNOPSIS

	use Text::Fill;

	print fill($initial_tab, $subsequent_tab, @text);

=head1 EXAMPLE

	print fill("", "", `cat book`);

=head1 DESCRIPTION

Text::Wrap::fill() is a simple multi-paragraph formatter.  It formats
each paragraph separately and then joins them together when it's done.  It
will destory any whitespace in the original text.  It breaks text into
paragraphs by looking for whitespace after a newline.  In other respects
it acts like wrap().

=head1 AUTHOR

I'm not sure where I got this.  Either I wrote it or Tim Pierce did.  I
found it at the bottom of Text::Wrap -- after not looking at it for a 
few years.  - David Muir Sharnoff <muir@idiom.com>

