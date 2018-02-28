
use ExtUtils::MakeMaker;

my $u = 'github.com/ap/Text-Tabs';

WriteMakefile( 
	'NAME'		=> 'Text-Wrap',
	'DISTNAME'	  => 'Text-Tabs+Wrap',
	'VERSION_FROM' => 'lib.modern/Text/Wrap.pm',
	($] >= 5.005 ? 
		(
			ABSTRACT	=> 'Expand tabs and do simple line wrapping',
			AUTHOR		=> 'David Muir Sharnoff <muir@idiom.org>',
			META_MERGE	=> {
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
	'dist' => { COMPRESS=>"gzip", SUFFIX=>"gz" },
	'INSTALLDIRS'	=> 'perl',

	PM =>	($] > 5.010 ?
		{
			'lib.modern/Text/Tabs.pm'	=> '$(INST_LIBDIR)/Text/Tabs.pm',
			'lib.modern/Text/Wrap.pm'	=> '$(INST_LIBDIR)/Text/Wrap.pm',
		}
		:
		{
			'lib.old/Text/Tabs.pm'	=> '$(INST_LIBDIR)/Text/Tabs.pm',
			'lib.old/Text/Wrap.pm'	=> '$(INST_LIBDIR)/Text/Wrap.pm',
		})
	);

sub MY::postamble { -f 'META.yml' ? return : <<'' }
create_distdir : MANIFEST
distdir        : MANIFEST
MANIFEST :
	( echo MANIFEST ; git ls-files ) | sort -f > MANIFEST

