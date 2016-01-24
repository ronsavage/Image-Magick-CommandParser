package Image::Magick::CommandParser;

use strict;
use utf8;
use warnings;
use warnings  qw(FATAL utf8);    # Fatalize encoding glitches.

use Data::Dumper::Concise; # For Dumper();
use Data::Section::Simple 'get_data_section';

use File::Slurper 'read_lines';

use Image::Magick::CommandParser::Actions;

use Log::Handler;

use Marpa::R2;

use Moo;

use Set::Array;

use Try::Tiny;

use Types::Standard qw/Any Bool HashRef Str/;

has command =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Any,
	required => 0,
);

has grammar =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Any, # 'Marpa::R2::Scanless::G'.
	required => 0,
);

has list_option =>
(
	default  => sub{return {} },
	is       => 'rw',
	isa      => HashRef,
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

has print_report =>
(
	default  => sub{return 0},
	is       => 'rw',
	isa      => Bool,
	required => 0,
);

has recce =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Any, # 'Marpa::R2::Scanless::R'.
	required => 0,
);

has result =>
(
	default  => sub{return {} },
	is       => 'rw',
	isa      => HashRef,
	required => 0,
);

our $VERSION = '1.00';

# -----------------------------------------------

sub BUILD
{
	my($self)			= @_;
	my($list_option)	= get_data_section('list_options');

	my(%list_option);

	for (split(/\n/, $list_option) )
	{
		$list_option{lc $_} = 1;
	}

	$self -> list_option({%list_option});

	#my($bnf)	= get_data_section('image_magick_bnf');
	my($bnf)	= join("\n", read_lines('data/command.line.options.bnf') );

	$self -> grammar
	(
		Marpa::R2::Scanless::G -> new({source => \$bnf})
	);

} # End of BUILD.

# --------------------------------------------------

sub _init
{
	my($self, %options) = @_;

	# Reset whatever so the object can be re-used.

	$self -> recce
	(
		Marpa::R2::Scanless::R -> new
		({
			grammar				=> $self -> grammar,
			ranking_method		=> 'high_rule_only',
			semantics_package	=> 'Image::Magick::CommandParser::Actions',
			#trace_terminals		=> 99,
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
	my($image_regexp)		= '^.+\s+(.+?\.(?:' . join('|', split/\n/, get_data_section('image_formats') ) . '))$';
	$image_regexp			= qr/$image_regexp/;

	if ($command =~ $image_regexp)
	{
		$output_file_name	= $1;
		$command			= substr($command, 0, - length($output_file_name) - 1);

		$self -> log(debug => "Output file: $output_file_name");
	}

	$self -> command($command);

	return ($command, $output_file_name);

} # End of _init.

# --------------------------------------------------

sub log
{
	my($self, $level, $s) = @_;

	$self -> logger -> log($level => $s) if ($self -> logger);

} # End of log.

# --------------------------------------------------

sub _process_ambiguous
{
	my($self, $cache, $output_file_name) = @_;
	my($count) = 0;

	my($item);
	my($param);
	my(@stack);

	while (my $value = $self -> recce -> value($cache) )
	{
		$self -> _process_unambiguous($cache, $output_file_name);

		push @stack, $self -> result;

		$self -> report($cache) if ($self -> print_report);

		$$cache{items} = Set::Array -> new;
	}

	# Eliminate duplicates from @stack.

	my(@result)		= shift @stack;
	my($standard)	= Dumper($result[0]);

	while (my $item = shift @stack)
	{
		if (Dumper($item) ne $standard)
		{
			push @result, $item;
		}
	}

	if ($#result > 0)
	{
		$self -> log(info => "Ambiguous results: \n" . Dumper(@result) );

		die "Error: Cannot handle some types of ambiguity\n";
	}

	$self -> result($result[0]);

} # End of _process_ambiguous.

# --------------------------------------------------

sub _process_unambiguous
{
	my($self, $cache, $output_file_name) = @_;
	my($list_option)	= $self -> list_option;
	my($result)			=
	{
		command		=> '',
		input_file	=> '',
		output_file	=> '',
		options		=> [],
	};

	my($action);
	my($input_file);
	my(@options, @operator, @offset);
	my($param_0, @param);

	for my $item ($$cache{items} -> print)
	{
		$param_0	= defined($$item{param}[0]) ? $$item{param}[0] : '';
		$action		= $$item{action};

		if ($action eq 'action_set')
		{
			@operator	= ();
			@param		= ();

			for my $param (@{$$item{param} })
			{
				if ($param =~ /^[a-zA-Z][-a-zA-Z]+:/)
				{
					push @operator, $param;
				}
				elsif ( ($#param >= 0) && $$list_option{$param[$#param]})
				{
					$self -> log(debug => "Warning. Moving $param");

					push @operator, $param;
				}
				else
				{
					push @param, $param;
				}
			}

			if ($#param >= 0)
			{
				push @options,
				{
					action	=> $action,
					param	=> [@param],
				};
			}

			if ($#operator >= 0)
			{
				push @options,
				{
					action	=> 'operator',
					param	=> [@operator],
				};
			}
		}
		elsif ($action eq 'command')
		{
			$$result{command} = $param_0;
		}
		elsif ($action eq 'input_file')
		{
			$$result{input_file} = $param_0;
		}
		elsif ($action eq 'operator')
		{
			push @options,
			{
				action	=> $action,
				param	=> [$param_0],
			};

			# Track the operators within the options, for post-processing just below.
			# See comment below for details.

			push @offset, $#options if ( ($param_0 =~ /^\"%/) || ($param_0 =~ /\"$/) );
		}
		else
		{
			push @options,
			{
				action	=> $action,
				param	=> $$item{param},
			};
		}
	}

	# In the case of input like -label "%m:%f %wx%h",
	# we end up with 2 operators, '"%m:%f' and '%wx%h"'.
	# Here we check for this special case and zap the 2 double-quotes,
	# hoping we don't zap quotes serving some other purpose.

	if ($#offset == 1)
	{
		if ( (substr($options[$offset[0] ]{param}[0], 0, 2) eq '"%') &&
			(substr($options[$offset[1] ]{param}[0], -1, 1) eq '"') )
		{
			substr($options[$offset[0] ]{param}[0], 0, 2)	= '%';
			substr($options[$offset[1] ]{param}[0], -1, 1)	= '';
		}
	}

	if ( ($#options >= 1) && ($options[1]{action} eq 'operator') )
	{
		my($candidate) = $options[1]{param}[0];

		if ( ($candidate =~ /^magick:/i) || ($candidate =~ /:$/) )
		{
			$input_file = $candidate;

			splice(@options, 1, 1);
		}
	}

	$self -> log(debug => 'd Reporting..................');

	$$cache{options} = [@options];

	$self -> report($cache);

	$$result{input_file}	= $input_file if (defined $input_file);
	$$result{output_file}	= $output_file_name if (length $output_file_name);
	$$result{options}		= [@options];

	$self -> result($result);

} # End of _process_unambiguous.

# ------------------------------------------------

sub report
{
	my($self, $cache)	= @_;
	my($format)			= '%-20s  %-s';

	$self -> log(debug => '-' x 50);
	$self -> log(debug => sprintf($format, 'Action', 'Params') );

	for my $item (@{$$cache{options} })
	{
		$self -> log(debug => sprintf($format, $$item{action}, join(', ', @{$$item{param} }) ) );
	}

	$self -> log(debug => '-' x 50);

} # End of report.

# ------------------------------------------------

sub run
{
	my($self, %options)	= @_;
	my(@command)		= $self -> _init(%options);
	my($message)		= $command[0] . (length($command[1]) ? " $command[1]" : '');

	$self -> log(info => "Command: $message");

	try
	{
		$self -> recce -> read(\$command[0]);
	}
	catch
	{
		die "$_\n";
	};

	my($ambiguity_metric)	= $self -> recce -> ambiguity_metric;
	my($cache)				=
	{
		items	=> Set::Array -> new,
		logger	=> $self -> logger,
	};

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
		$self -> recce -> value($cache);
		$self -> _process_unambiguous($cache, $command[1]);
		$self -> report($cache) if ($self -> print_report);
		$self -> log(info => "Result: \n" . Dumper($self -> result) );
	}
	else
	{
		$self -> log(info => 'Warning: Parse is ambiguous');
		$self -> _process_ambiguous($cache, $command[1]);
		$self -> log(info => "Result: \n" . Dumper($self -> result) );
	}

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
@@ image_formats
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

@@ image_magick_bnf
:default				::= action => ::first

#lexeme default			= latm => 1		# Longest Acceptable Token Match.

# G1-level rules.

:start					::= command_and_options

command_and_options		::= command_name input_file_name rule_set

command_name			::= 'convert'					action => command
							| 'mogrify'					action => command

input_file_name			::= string						action => input_file
input_file_name			::=								action => input_file

rule_set				::= rule*

rule					::= action_set
							| open_parenthesis
							| close_parenthesis

action_set				::= sign string parameter_set	action => action_set

sign					::= minus_sign					action => sign
							| plus_sign

parameter_set			::= string+

close_parenthesis		::= close_paren					action => close_parenthesis

open_parenthesis		::= open_paren					action => open_parenthesis

# L0-level rules (lexemes) in alphabetical order.

close_paren				~ ')'

open_paren				~ '('

minus_sign				~ '-'

plus_sign				~ '+'

string					~ string_char+
string_char				~ [^-+\(\)]

# L0 lexemes for the boilerplate.

:discard				~ whitespace
whitespace				~ [\s]+

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
