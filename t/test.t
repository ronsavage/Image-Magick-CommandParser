use strict;
use warnings;

use File::Spec;
use File::Temp;

use Image::Magick::CommandParser;

use Test::Stream -Classic;

# ------------------------------------------------

my(@test) =
(
{
	count	=> 1,
	input	=> 'convert logo:',
},
{
	count	=> 2,
	input	=> 'convert logo: output.png',
},
{
	count	=> 3,
	input	=> 'convert logo: -size 320x85 output.png',
},
{
	count	=> 4,
	input	=> 'convert logo: -size 320x85 -shade 110x90 output.png',
},
{
	count	=> 5,
	input	=> 'convert logo: -size 320x85 canvas:none -shade 110x90 output.png',
},
{
	count	=> 6,
	input	=> 'convert logo: -size 320x85 ( +clone canvas:none -shade 110x90 ) output.png',
},
{
	count	=> 7,
	input	=> 'convert logo: -size 320x85 ( canvas:none +clone -shade 110x90 ) output.png',
},
{
	count	=> 8,
	input	=> 'convert logo: canvas:none +clone output.png',
},
{
	count	=> 9,
	input	=> 'convert xc: -gravity East output.png',
},
{
	count	=> 10,
	input	=> 'convert rose.jpg rose.png',
},
{
	count	=> 11,
	input	=> 'convert label.gif -compose Plus button.gif',
},
{
	count	=> 12,
	input	=> 'convert label.gif ( +clone -shade 110x90 -normalize -negate +clone -compose Plus -composite ) button.gif',
},
{
	count	=> 13,
	input	=> 'convert label.gif ( +clone -shade 110x90 -normalize -negate +clone -compose Plus -composite ) ( -clone 0 -shade 110x50 -normalize -channel BG -fx 0 +channel -matte ) -delete 0 +swap -compose Multiply -composite button.gif',
},
{
	count	=> 14,
	input	=> 'convert magick:logo -label "%m:%f %wx%h" logo.png',
},
{
	count	=> 15,
	input	=> 'convert magick:logo -label "%m:%f %wx%h %n" logo.png',
},
{
	count	=> 16,
	input	=> 'convert magick:rose -label @t/info.txt -format "%l label" rose.png',
},
{
	count	=> 17,
	input	=> 'convert -label @t/info.txt magick:rose -format "%l label" rose.png',
},
{
	count	=> 18,
	input	=> 'convert rose.jpg -resize 50% rose.png',
},
{
	count	=> 19,
	input	=> 'convert rose.jpg -resize 60x40% rose.png',
},
{
	count	=> 20,
	input	=> 'convert rose.jpg -resize 60%x40 rose.png',
},
{
	count	=> 21,
	input	=> 'convert rose.jpg -resize 60%x40% rose.png',
},
#		'convert -background lightblue -fill blue -font FreeSerif -pointsize 72 -label Marpa Marpa.png', # 14.
#		'convert -background lightblue -fill blue -font DejaVu-Serif-Italic -pointsize 72 -label Marpa Marpa.png', # 15.
);
my($parser)	= Image::Magick::CommandParser -> new;
my($limit)	= shift;

my($got);
my($result);

for my $test (@test)
{
	next if ($$test{count} != $limit);

	$result = $parser -> run($$test{input});

	if ($result == 0)
	{
		$got = $parser -> result;

		is_deeply($got, $$test{input}, $$test{input});
	}
	else
	{
		die "Test $$test{count} failed to return 0 from run()\n";
	}
}

done_testing;
