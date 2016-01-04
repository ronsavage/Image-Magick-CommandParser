use strict;
use warnings;

use ExtUtils::MakeMaker;

# ----------------

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

my(%params) =
(
	($] ge '5.005') ?
	(
		AUTHOR   => 'Ron Savage (ron@savage.net.au)',
		ABSTRACT => 'Render a cladogram using Imager or Image::Magick',
	) : (),
	clean =>
	{
		FILES => 'blib/* Makefile MANIFEST Tree-Cladogram-*'
	},
	dist =>
	{
		COMPRESS => 'gzip',
		SUFFIX   => 'gz'
	},
	DISTNAME  => 'Tree-Cladogram',
	NAME      => 'Tree::Cladogram',
	LICENSE   => 'artistic_2',
	PL_FILES  => {},
	PREREQ_PM =>
	{
		'File::Slurper'		=> 0.008,
		'Getopt::Long'		=> 0,
		'Moo'				=> 2.000002,
		'parent'			=> 0,
		'Pod::Usage'		=> 1.67,
		'strict'			=> 0,
		'Test::More'		=> 1.001014,
		'Test::Stream'		=> 1.302026,
		'Test::Pod'			=> 1.48,
		'Tree::DAG_Node'	=> 1.27,
		'Types::Standard'	=> 1.00000,
		'warnings'			=> 0,
	},
	VERSION_FROM => 'lib/Tree/Cladogram.pm',
);

if ( ($ExtUtils::MakeMaker::VERSION =~ /^\d\.\d\d$/) && ($ExtUtils::MakeMaker::VERSION > 6.30) )
{
	$params{LICENSE} = 'artistic_2';
}

if ($ExtUtils::MakeMaker::VERSION ge '6.46')
{
	$params{META_MERGE} =
	{
		'meta-spec' =>
		{
		'version' => 2,
		},
		resources   =>
		{
		'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Tree-Cladogram',
		'license' => 'http://opensource.org/licenses/Artistic-2.0',
			repository =>
			{
		'type' => 'git',
		'url' => 'https://github.com/ronsavage/Tree-Cladogram.git',
		'web' => 'https://github.com/ronsavage/Tree-Cladogram',
			},
		},
	};
}

WriteMakefile(%params);
