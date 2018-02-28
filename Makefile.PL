use 5.006; use strict; use warnings;

use ExtUtils::MakeMaker;

my $u = 'github.com/ap/Text-Tabs';

WriteMakefile( 
	NAME         => 'Text::Tabs',
	VERSION_FROM => 'lib/Text/Tabs.pm',
			ABSTRACT	=> 'Expand tabs and do simple line wrapping',
			AUTHOR		=> 'David Muir Sharnoff <muir@idiom.org>',
	( eval { ExtUtils::MakeMaker->VERSION(6.48) } ?
		(
			MIN_PERL_VERSION => '5.006',
			META_MERGE	=> {
				dynamic_config => 0,
				resources  => {
					repository => { type => 'git', url => "git://$u.git", web => "https://$u" },
					bugtracker => { web => "https://$u/issues" },
				},
				'meta-spec' => { version => 2 },
			}
		) 
		: 
		()
	),
	INSTALLDIRS => ( "$]" >= 5.011 ? 'site' : 'perl' ),
	);

sub MY::postamble { -f 'META.yml' ? return : <<'' }
create_distdir : MANIFEST
distdir        : MANIFEST
MANIFEST :
	( echo MANIFEST ; git ls-files ) | sort -f > MANIFEST

