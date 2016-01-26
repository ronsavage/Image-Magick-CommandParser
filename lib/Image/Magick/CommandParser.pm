package Image::Magick::CommandParser;

use strict;
use utf8;
use warnings;
use warnings  qw(FATAL utf8);    # Fatalize encoding glitches.

use Data::Dumper::Concise; # For Dumper();
use Data::Section::Simple 'get_data_section';

use Log::Handler;

use Moo;

use Set::Array;

use Set::FA::Element;

use Types::Standard qw/Any HashRef Str/;

has image_formats_regexp =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Str,
	required => 0,
);

has logger =>
(
	default  => sub{return undef},
	is       => 'rw',
	isa      => Any,
	required => 0,
);

has maxlevel =>
(
	default  => sub{return 'notice'},
	is       => 'rw',
	isa      => Str,
	required => 0,
);

has minlevel =>
(
	default  => sub{return 'error'},
	is       => 'rw',
	isa      => Str,
	required => 0,
);

has stack =>
(
	default  => sub{return Set::Array -> new},
	is       => 'rw',
	isa      => Any,
	required => 0,
);

my($myself); # For use inside functions.

our $VERSION = '1.00';

# -----------------------------------------------

sub BUILD
{
	my($self)	= @_;
	$myself		= $self;

	if (! defined $self -> logger)
	{
		$self -> logger(Log::Handler -> new);
		$self -> logger -> add
		(
			screen =>
			{
				maxlevel       => $self -> maxlevel,
				message_layout => '%m',
				minlevel       => $self -> minlevel,
				utf8           => 1,
			}
		);
	}

	my($list) = get_data_section('image_formats');

	$self -> image_formats_regexp(join('|', split(/\n/, $list) ) );

} # End of BUILD.

# ----------------------------------------------
# Warning: this a function, not a method.

sub action
{
	my($dfa)	= @_;
	my($name)	= 'action';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of action.

# ----------------------------------------------
# Warning: this a function, not a method.

sub close_parenthesis
{
	my($dfa)	= @_;
	my($name)	= 'close_parenthesis';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of close_parenthesis.

# ----------------------------------------------
# Warning: this a function, not a method.

sub command
{
	my($dfa)	= @_;
	my($name)	= 'command';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of command.

# ----------------------------------------------
# Warning: this a function, not a method.

sub done
{
	my($dfa)	= @_;
	my($name)	= 'done';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of done.

# ----------------------------------------------
# Warning: this a function, not a method.

sub input_file
{
	my($dfa)	= @_;
	my($name)	= 'input_file';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of input_file.

# --------------------------------------------------

sub log
{
	my($self, $level, $s) = @_;

	$self -> logger -> log($level => $s) if ($self -> logger);

} # End of log.

# ----------------------------------------------
# Warning: this a function, not a method.

sub open_parenthesis
{
	my($dfa)	= @_;
	my($name)	= 'open_parenthesis';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of open_parenthesis.

# ----------------------------------------------
# Warning: this a function, not a method.

sub output_file
{
	my($dfa)	= @_;
	my($name)	= 'output_file';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of output_file.

# ----------------------------------------------
# Warning: this a function, not a method.

sub operator
{
	my($dfa)	= @_;
	my($name)	= 'operator';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of operator.

# ----------------------------------------------
# Warning: this a function, not a method.

sub parameter
{
	my($dfa)	= @_;
	my($name)	= 'parameter';
	my($match)	= $dfa -> match;

	$myself -> stack -> push
	({
		token	=> $match,
		type	=> $name,
	});

	$myself -> log(debug => "'$name' matched '" . $dfa -> match . "'");

} # End of parameter.

# ------------------------------------------------

sub run
{
	my($self, %options)			= @_;
	my($image_formats_regexp)	= $self -> image_formats_regexp;
	my($dfa)					= Set::FA::Element -> new
	(
		accepting	=> ['done'],
		actions		=>
		{
			action =>
			{
				entry	=> \&action,
			},
			close_parenthesis =>
			{
				entry	=> \&close_parenthesis,
			},
			command =>
			{
				entry	=> \&command,
			},
			done =>
			{
				entry	=> \&done,
			},
			input_file =>
			{
				entry	=> \&input_file,
			},
			open_parenthesis =>
			{
				entry	=> \&open_parenthesis,
			},
			operator =>
			{
				entry	=> \&operator,
			},
			output_file =>
			{
				entry	=> \&output_file,
			},
			parameter =>
			{
				entry	=> \&parameter,
			},
			reaction =>
			{
				entry	=> \&action, # Sic.
			},
		},
		die_on_loop	=> 1,
		maxlevel	=> 'debug',
		start		=> 'start',
		transitions	=>
		[
			['action',				'^$',								'done'],
			['action',				'[-+][a-zA-Z]+',					'reaction'],
			['action',				'\(',								'open_parenthesis'],
			['action',				'\)',								'close_parenthesis'],
			['action',				'\d+x\d+',							'parameter'],
			['action',				'\d+%x\d+%',						'parameter'],
			['action',				'\d+%',								'parameter'],
			['action',				'[a-zA-Z][-a-zA-Z]+:[a-zA-Z]+',		'operator'],
			['action',				'[a-zA-Z][-a-zA-Z]+',				'parameter'],

			['command',				'^$',								'done'],
			['command',				".+\.(?:$image_formats_regexp)",	'input_file'],

			['done',				'^$',								'done'],

			['input_file',			'^$',								'done'],
			['input_file',			'[-+][a-zA-Z]+',					'action'],
			['input_file',			'[a-zA-Z][-a-zA-Z]+:[a-zA-Z]+',		'operator'],
			['input_file',			".+\.(?:$image_formats_regexp)",	'output_file'],

			['close_parenthesis',	'^$',								'done'],
			['close_parenthesis',	'\(',								'open_parenthesis'],
			['close_parenthesis',	'[a-zA-Z][-a-zA-Z]+:[a-zA-Z]+',		'operator'],
			['close_parenthesis',	'[-+][a-zA-Z]+',					'action'],
			['close_parenthesis',	".+\.(?:$image_formats_regexp)",	'output_file'],

			['open_parenthesis',	'^$',								'done'],
			['open_parenthesis',	'\)',								'close_parenthesis'],
			['open_parenthesis',	'[a-zA-Z][-a-zA-Z]+:[a-zA-Z]+',		'operator'],
			['open_parenthesis',	'[-+][a-zA-Z]+',					'action'],
			['open_parenthesis',	".+\.(?:$image_formats_regexp)",	'output_file'],

			['operator',			'^$',								'done'],
			['operator',			'[-+][a-zA-Z]+',					'action'],
			['operator',			".+\.(?:$image_formats_regexp)",	'output_file'],

			['output_file',			'^$',								'done'],

			['parameter',			'^$',								'done'],
			['parameter',			'\(',								'open_parenthesis'],
			['parameter',			'\)',								'close_parenthesis'],
			['parameter',			'[-+][a-zA-Z]+',					'action'],
			['parameter',			'[a-zA-Z][-a-zA-Z]+:[a-zA-Z]+',		'operator'],
			['parameter',			".+\.(?:$image_formats_regexp)",	'output_file'],

			['reaction',			'^$',								'done'],
			['reaction',			'[-+][a-zA-Z]+',					'action'],
			['reaction',			'\(',								'open_parenthesis'],
			['reaction',			'\)',								'close_parenthesis'],
			['reaction',			'\d+x\d+',							'parameter'],
			['reaction',			'\d+%x\d+%',						'parameter'],
			['reaction',			'\d+%',								'parameter'],
			['reaction',			'[a-zA-Z][-a-zA-Z]+:[a-zA-Z]+',		'operator'],
			['reaction',			'[a-zA-Z][-a-zA-Z]+',				'parameter'],

			['start',				'convert|mogrify',					'command'],
		],
	);
	my(@candidate) =
	(
		'convert logo:', # 0.
		'convert logo: output.png', # 1.
		'convert logo: -size 320x85 output.png', # 2.
		'convert logo: -size 320x85 -shade 110x90 output.png', # 3.
		'convert logo: -size 320x85 canvas:none -shade 110x90 output.png', # 4.
		'convert logo: canvas:none +clone output.png', # 5.
		'convert xc: -gravity East output.png', # 6.
		'convert rose.jpg rose.png', # 7.
		'convert rose.jpg -resize 50% rose.png', # 8.
		'convert rose.jpg -resize 60%x40% rose.png', # 9.
		'convert label.gif -compose Plus button.gif', # 10.
		'convert logo: -size 320x85 ( +clone canvas:none -shade 110x90 ) output.png', # 11.
		'convert logo: -size 320x85 ( canvas:none +clone -shade 110x90 ) output.png', # 12.
	);

	my($count, $candidate);
	my(@field);

	for my $i (0 .. $#candidate)
	{
		next if ($i != 12);

		$count		= 0;
		$candidate	= $candidate[$i];
		@field		= split(/\s+/, $candidate);

		print "Processing input string: $candidate\n";

		for my $field (@field)
		{
			print "Field: $field\n";

			$dfa -> step($field);
		}
	}

	$self -> log(debug => 'At end, current state: ' . $dfa -> current);
	$self -> log(debug => "Processed input string: $candidate");
	$self -> log(debug => "token => $$_{token}. type => $$_{type}.") for $self -> stack -> print;

	# Return 0 for success and 1 for failure.

	return 0;

} # End of run.

# ------------------------------------------------

1;

=pod

=head1 NAME

C<Image::Magick::CommandParser> - Parse any command line used by ImageMagick

=head1 Synopsis


=head1 Description


=head1 Distributions


=head1 Constructor and Initialization


=head1 Methods


=head1 FAQ

=head1 Troubleshooting

=head2 I'm having problems with single- 'v' double-quotes on the command line

When using something like -label "%m:%f %wx%h", you have to use double-quotes.

As an experiment, I patched the code to allow single- or double- quotes, but it did not work.

=head2 I'm having problems with the '-compose' option

This module returns '-compose' as 2 separate element in the C<options> arrayref:

	options =>
	[
		{
			name => "action_set",
			param =>
			[
				"-",
				"compose"
			]
		},
		{
			name => "operator",
			param =>
			[
				"Plus"
			]
		}
	]

=head1 See Also

L<https://metacpan.org/pod/Image::Magick::Chart>

L<https://metacpan.org/pod/Image::Magick::PolyText>

L<https://metacpan.org/pod/Image::Magick::Tiler>

=head1 Machine-Readable Change Log

The file Changes was converted into Changelog.ini by L<Module::Metadata::Changes>.

=head1 Version Numbers

Version numbers < 1.00 represent development versions. From 1.00 up, they are production versions.

=head1 Repository

L<https://github.com/ronsavage/Image-Magick-CommandParser>

=head1 Support

Email the author, or log a bug on RT:

L<https://rt.cpan.org/Public/Dist/Display.html?Name=Image::Magick::CommandParser>.

=head1 Author

L<Tree::Cladogram> was written by Ron Savage I<E<lt>ron@savage.net.auE<gt>> in 2016.

My homepage: L<http://savage.net.au/>

=head1 Copyright

Australian copyright (c) 2016, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Artistic License 2.0, a copy of which is available at:
	http://opensource.org/licenses/alphabetical.

=cut

__DATA__
@@ action_with_parameters
background
compress
fill
font
gravity
pointsize

@@ action_with_strings
format
label

@@ compose_parameters
Atop
Blend
Blur
Bumpmap
ChangeMask
Clear
ColorBurn
ColorDodge
Colorize
CopyBlack
CopyBlue
CopyCyan
CopyGreen
Copy
CopyMagenta
CopyOpacity
CopyRed
CopyYellow
Darken
DarkenIntensity
DivideDst
DivideSrc
Dst
Difference
Displace
Dissolve
Distort
DstAtop
DstIn
DstOut
DstOver
Exclusion
HardLight
HardMix
Hue
In
Lighten
LightenIntensity
LinearBurn
LinearDodge
LinearLight
Luminize
Mathematics
MinusDst
MinusSrc
Modulate
ModulusAdd
ModulusSubtract
Multiply
None
Out
Overlay
Over
PegtopLight
PinLight
Plus
Replace
Saturate
Screen
SoftLight
Src
SrcAtop
SrcIn
SrcOut
SrcOver
VividLight
Xor

@@ image_formats
3fr
aai
ai
art
arw
avi
avs
a
bgra
bgro
bgr
bmp2
bmp3
bmp
brf
b
cals
cal
canvas
caption
cin
cip
clip
cmyka
cmyk
cr2
crw
cur
cut
c
data
dcm
dcr
dcx
dds
dfont
dng
dot
dpx
dxt1
dxt5
epdf
epi
eps
eps2
eps3
epsf
epsi
erf
fax
fits
fractal
fts
g3
gif
gif87
gradient
gray
gv
g
h
hald
hdr
histogram
hrz
html
htm
icb
icon
ico
iiq
info
inline
ipl
isobrl
isobrl6
jng
jnx
jpe
jpeg
jpg
jps
json
k
k25
kdc
label
m
m2v
m4v
mac
magick
map
mask
mat
matte
mef
miff
mkv
mng
mono
mov
mp4
mpc
mpeg
mpg
mrw
msl
msvg
mtv
mvg
nef
nrw
null
o
orf
otb
otf
pal
palm
pam
pango
pattern
pbm
pcd
pcds
pcl
pct
pcx
pdb
pdf
pdfa
pef
pes
pfa
pfb
pfm
pgm
picon
pict
pix
pjpeg
plasma
png
png00
png24
png32
png48
png64
png8
pnm
ppm
preview
ps
ps2
ps3
psb
psd
pwp
r
radial-gradient
raf
ras
raw
rgb
rgba
rgbo
rgf
rla
rle
rmf
rw2
scr
screenshot
sct
sfw
sgi
shtml
six
sixel
sparse-color
sr2
srf
stegano
sun
svg
svgz
text
tga
thumbnail
tile
tim
ttc
ttf
txt
ubrl
ubrl6
uil
uyvy
vda
vicar
vid
viff
vips
vst
wbmp
wmv
wpg
x
x3f
xbm
xc
xcf
xpm
xps
xv
xwd
y
ycbcr
ycbcra
yuv

@@ list_options
Align
Alpha
Boolean
Cache
Channel
Class
ClipPath
Coder
Color
Colorspace
Command
Compliance
Complex
Compose
Compress
Configure
DataType
Debug
Decoration
Delegate
Direction
Dispose
Distort
Dither
Endian
Evaluate
FillRule
Filter
Font
Format
Function
Gradient
Gravity
Intensity
Intent
Interlace
Interpolate
Kernel
Layers
LineCap
LineJoin
List
Locale
LogEvent
Log
Magic
Method
Metric
Mime
Mode
Morphology
Module
Noise
Orientation
PixelIntensity
Policy
PolicyDomain
PolicyRights
Preview
Primitive
QuantumFormat
Resource
SparseColor
Statistic
Storage
Stretch
Style
Threshold
Type
Units
Validate
VirtualPixel
Weight
