package Image::Magick::CommandParser;

use strict;
use utf8;
use warnings;
use warnings  qw(FATAL utf8);    # Fatalize encoding glitches.

use Data::Section::Simple 'get_data_section';

use File::Slurper 'read_lines';

use Image::Magick::CommandParser::Actions;

use Log::Handler;

use Marpa::R2;

use Moo;

use Set::Array;

use Types::Standard qw/Any Object Str/;

has command =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Str,
	required => 0,
);

has grammar =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Any, # 'Marpa::R2::Scanless::G'.
	required => 0,
);

has items =>
(
	default  => sub{return undef},
	is       => 'rw',
	isa      => Any,
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

has recce =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Any, # 'Marpa::R2::Scanless::R'.
	required => 0,
);

our $VERSION = '1.00';

# -----------------------------------------------

sub BUILD
{
	my($self) = @_;

	my(@bnf) = read_lines('data/command.line.options.bnf');

	$self -> grammar
	(
		Marpa::R2::Scanless::G -> new({source => \join("\n", @bnf)})
	);

} # End of BUILD.

# --------------------------------------------------

sub _init
{
	my($self, %options) = @_;

	# Reset whatever so the object can be re-used.

	$self -> items(Set::Array -> new);
	$self -> recce
	(
		Marpa::R2::Scanless::R -> new
		({
			grammar           => $self -> grammar,
			semantics_package => 'Image::Magick::CommandParser::Actions',
		})
	);

	# Allow run(command => '...', minlevel => '...', maxlevel => '...').

	$self -> logger(Log::Handler -> new);
	$self -> logger -> add
	(
		screen =>
		{
			maxlevel       => $options{maxlevel} ? $options{maxlevel} : $self -> maxlevel,
			message_layout => '%m',
			minlevel       => $options{minlevel} ? $options{minlevel} : $self -> minlevel,
			utf8           => 1,
		}
	);

	# Strip off any output file name.

	my($command)			= $options{command} ? $options{command} : $self -> command;
	$command				=~ s/^\s+//;
	$command				=~ s/\s+$//;
	my($output_file_name)	= '';
	my($image_regexp)		= 'qr/(.+)\.(' . join('|', split/\n/, get_data_section('image.formats') ) . ')/';
	my($rindex)				= rindex($command, ' ');
	my($suffix)				= substr($command, $rindex + 1);

	$self -> log(debug => $image_regexp);
	$self -> log(debug => "rindex: $rindex. Suffix: $suffix");

	if ($suffix =~ $image_regexp)
	{
		$command			= substr($command, 0, $rindex - 1);
		$output_file_name	= "$1.$2";

		$self -> log(debug => "Command now '$command'\nOutput file '$output_file_name'");
	}

	$self -> command($command);

	return ($command, $output_file_name);

} # End of _init.

# --------------------------------------------------

sub log
{
	my($self, $level, $s) = @_;
	$level = 'notice' if (! defined $level);
	$s     = ''       if (! defined $s);

	$self -> logger -> $level($s) if ($self -> logger);

} # End of log.

# ------------------------------------------------

sub run
{
	my($self, %options)	= @_;
	my(@command)		= $self -> _init(%options);

	$self -> log(debug => "Command: '$command[0]'");
	$self -> log(debug => "Output:  '$command[1]'");

	my($cache)	=
	{
		logger	=> $self -> logger,
		items	=> $self -> items,
		self	=> $self, # For access to logger within decode_result().
	};

	$self -> recce -> read(\$command[0]);

	my($result)				= $self -> recce -> value($cache);
	my($ambiguity_metric)	= $self -> recce -> ambiguity_metric;

	if ($ambiguity_metric <= 0)
	{
		my($line, $column)	= $self -> recce -> line_column();
		my($whole_length)	= length $command[0];
		my($suffix)			= substr($command[0], ($whole_length - 100) );
		my($suffix_length)	= length $suffix;
		my($s)				= $suffix_length == 1 ? 'char' : "$suffix_length chars";
		my($message)		= "Call to ambiguity_metric() returned $ambiguity_metric (i.e. an error). \n"
			. "Marpa exited at (line, column) = ($line, $column) within the input string. \n"
			. "Input length: $whole_length. Last $s of input: '$suffix'";

		$self -> log(error => "Error. Parse failed. $message");
	}
	elsif ($ambiguity_metric == 1)
	{
		$self -> log(debug => 'Parse is unambiguous');

		my($format) = '%4s  %-20s  %-s';

		$self -> log(info => sprintf($format, 'Sign', 'Rule', 'Params') );

		for my $item ($self -> items -> print)
		{
			$self -> log(info => sprintf($format, $$item{sign}, $$item{rule}, join(', ', @{$$item{params} }) ) );
		}
	}
	else
	{
		$self -> log(error => 'Error. Parse is ambiguous');
	}


	# Return 0 for success and 1 for failure.

	return 0;

} # End of write.

# ------------------------------------------------

1;

=pod

=head1 NAME

C<Image::Magick::CommandParser> - Parse any command line used by ImageMagick

=head1 Synopsis

See L<Tree::Cladogram/Synopsis>.

=head1 Description

See L<Tree::Cladogram/Description>.

=head1 Distributions

See L<Tree::Cladogram/Distributions>.

=head1 Constructor and Initialization

See L<Tree::Cladogram/Constructor and Initialization>.

=head1 Methods

See L<Tree::Cladogram/Methods>.

=head1 FAQ

See L<Tree::Cladogram/FAQ>.

=head1 See Also

See L<Tree::Cladogram/See Also>.

=head1 Machine-Readable Change Log

The file Changes was converted into Changelog.ini by L<Module::Metadata::Changes>.

=head1 Version Numbers

Version numbers < 1.00 represent development versions. From 1.00 up, they are production versions.

=head1 Repository

L<https://github.com/ronsavage/Tree-Cladogram>

=head1 Support

Email the author, or log a bug on RT:

L<https://rt.cpan.org/Public/Dist/Display.html?Name=Tree::Cladogram>.

=head1 Author

L<Tree::Cladogram> was written by Ron Savage I<E<lt>ron@savage.net.auE<gt>> in 2015.

My homepage: L<http://savage.net.au/>

=head1 Copyright

Australian copyright (c) 2015, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Artistic License 2.0, a copy of which is available at:
	http://opensource.org/licenses/alphabetical.

=cut

__DATA__
@@ image.formats
3fr
a
aai
ai
art
arw
avi
avs
b
bgr
bgra
bgro
bmp
bmp2
bmp3
brf
c
cal
cals
canvas
caption
cin
cip
clip
cmyk
cmyka
cr2
crw
cur
cut
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
g
g3
gif
gif87
gradient
gray
gv
h
hald
hdr
histogram
hrz
htm
html
icb
ico
icon
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
