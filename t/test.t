use strict;
use warnings;

use File::Glob ':bsd_glob';
use File::Spec;
use File::Temp;

use Image::Magick::CommandParser;

use Test::Stream -Classic;

# ------------------------------------------------

my(@test) =
(
{
	command	=> 'convert logo:',
	count	=> 1,
},
{
	command	=> 'convert logo: output.png',
	count	=> 2,
},
{
	command	=> 'convert logo: -size 320x85 output.png',
	count	=> 3,
},
{
	command	=> 'convert logo: -size 320x85 -shade 110x90 output.png',
	count	=> 4,
},
{
	command	=> 'convert logo: -size 320x85 canvas:none -shade 110x90 output.png',
	count	=> 5,
},
{
	command	=> 'convert logo: -size 320x85 ( +clone canvas:none -shade 110x90 ) output.png',
	count	=> 6,
},
{
	command	=> 'convert logo: -size 320x85 ( canvas:none +clone -shade 110x90 ) output.png',
	count	=> 7,
},
{
	command	=> 'convert logo: canvas:none +clone output.png',
	count	=> 8,
},
{
	command	=> 'convert gradient:red-green -gravity East output.png',
	count	=> 9,
},
{
	command	=> 'convert rose.jpg rose.png',
	count	=> 10,
},
{
	command	=> 'convert label.gif -compose Plus button.gif',
	count	=> 11,
},
{
	command	=> 'convert label.gif ( +clone -shade 110x90 -normalize -negate +clone -compose Plus -composite ) button.gif',
	count	=> 12,
},
{
	command	=> 'convert label.gif ( +clone -shade 110x90 -normalize -negate +clone -compose Plus -composite ) ( -clone 0 -shade 110x50 -normalize -channel BG -fx 0 +channel -matte ) -delete 0 +swap -compose Multiply -composite button.gif',
	count	=> 13,
},
{
	command	=> 'convert magick:logo -label "%m:%f %wx%h" logo.png',
	count	=> 14,
},
{
	command	=> 'convert magick:logo -label "%m:%f %wx%h %n" logo.png',
	count	=> 15,
},
{
	command	=> 'convert magick:rose -label @t/info.txt -format "%l label" rose.png',
	count	=> 16,
},
{
	command	=> 'convert -label @t/info.txt magick:rose -format "%l label" rose.png',
	count	=> 17,
},
{
	command	=> 'convert rose.jpg -resize 50% rose.png',
	count	=> 18,
},
{
	command	=> 'convert rose.jpg -resize 60x40% rose.png',
	count	=> 19,
},
{
	command	=> 'convert rose.jpg -resize 60%x40 rose.png',
	count	=> 20,
},
{
	command	=> 'convert rose.jpg -resize 60%x40% rose.png',
	count	=> 21,
},
{
	command	=> 'convert -background lightblue -fill blue -font FreeSerif -pointsize 72 -label Marpa Marpa.png',
	count	=> 22,
},
{
	command	=> 'convert -background lightblue -fill blue -font DejaVu-Serif-Italic -pointsize 72 -label Marpa Marpa.png',
	count	=> 23,
},
{
	command	=> 'convert logo: -size 320x85^ output.png',
	count	=> 24,
},
{
	command	=> 'convert logo: -size 320x85! output.png',
	count	=> 25,
},
{
	command	=> 'convert logo: -size 320x85< output.png',
	count	=> 26,
},
{
	command	=> 'convert logo: -size 320x85> output.png',
	count	=> 27,
},
{
	command	=> 'convert logo: -size 320x85+0+0 output.png',
	count	=> 28,
},
{
	command	=> 'convert rose.jpg -resize 50%+0+0 rose.png',
	count	=> 29,
},
{
	command	=> 'convert rose.jpg -resize 60x40%+0+0 rose.png',
	count	=> 30,
},
{
	command	=> 'convert rose.jpg -resize 60%x40+0+0 rose.png',
	count	=> 31,
},
{
	command	=> 'convert rose.jpg -resize 60%x40%+0+0 rose.png',
	count	=> 32,
},
{
	command	=> 'convert rose.jpg -resize 50%!+0+0 rose.png',
	count	=> 33,
},
{
	command	=> 'convert rose.jpg -resize 60x40%<+0+0 rose.png',
	count	=> 34,
},
{
	command	=> 'convert rose.jpg -resize 60%x40>+0+0 rose.png',
	count	=> 35,
},
{
	command	=> 'convert logo: -size 320x85^ output.png',
	count	=> 36,
},
{
	command	=> 'convert logo: -size 320x85! output.png',
	count	=> 37,
},
{
	command	=> 'convert logo: -size 320x85< output.png',
	count	=> 38,
},
{
	command	=> 'convert logo: -size 320x85> output.png',
	count	=> 39,
},
{
	command	=> 'convert pattern:bricks -size 320x85 output.png',
	count	=> 40,
},
{
	command	=> 'convert rgb:camera.image -size 320x85 output.png',
	count	=> 41,
},
{
	command	=> 'convert - -size 320x85 output.png',
	count	=> 42,
},
{
	command	=> 'convert gif:- -size 320x85 output.png',
	count	=> 43,
},
{
	command	=> 'convert fd:3 -size 320x85 output.png',
	count	=> 44,
},
{
	command	=> 'convert gif:fd:3 -size 320x85 output.png',
	count	=> 45,
},
{
	command	=> 'convert fd:3 png:fd:4 gif:fd:5 fd:6 -append output.png',
	count	=> 46,
},
);
my($limit)		= shift || 0;
my($maxlevel)	= shift || 'notice';
my($parser)		= Image::Magick::CommandParser -> new(maxlevel => $maxlevel);

my($got);
my($result);

for my $test (@test)
{
	next if ($$test{count} != $limit);

	$result = $parser -> run(command => $$test{command});

	if ($result == 0)
	{
		$got = $parser -> result;

		is_deeply($got, $$test{command}, "$$test{count}: $$test{command}");
	}
	else
	{
		die "Test $$test{count} failed to return 0 from run()\n";
	}
}

done_testing;

my(@file_list) = bsd_glob('colors/*.png');

note "Glob: $_" for @file_list;
