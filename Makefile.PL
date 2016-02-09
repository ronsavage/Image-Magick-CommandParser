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
		ABSTRACT => 'Parse any command line acceptable to convert or mogrify',
	) : (),
	clean =>
	{
		FILES => 'blib/* Makefile MANIFEST Image-Magick-CommandParser-*'
	},
	dist =>
	{
		COMPRESS => 'gzip',
		SUFFIX   => 'gz'
	},
	DISTNAME  => 'Image-Magick-CommandParser',
	NAME      => 'Image::Magick::CommandParser',
	LICENSE   => 'artistic_2',
	PL_FILES  => {},
	PREREQ_PM =>
	{
		'Data::Section::Simple'	=> 0.07,
		'File::Slurper'			=> 0.008,
		'Getopt::Long'			=> 0,
		'Moo'					=> 2.000002,
		'Pod::Usage'			=> 1.67,
		'strict'				=> 0,
		'Test::Stream'			=> 1.302026,
		'Test::Pod'				=> 1.48,
		'Types::Standard'		=> 1.00000,
		'warnings'				=> 0,
	},
	VERSION_FROM => 'lib/Image/Magick/CommandParser.pm',
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
		'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html?Name=Image-Magick-CommandParser',
		'license' => 'http://opensource.org/licenses/Artistic-2.0',
			repository =>
			{
		'type' => 'git',
		'url' => 'https://github.com/ronsavage/Image-Magick-CommandParser.git',
		'web' => 'https://github.com/ronsavage/Image-Magick-CommandParser',
			},
		},
	};
}

WriteMakefile(%params);
