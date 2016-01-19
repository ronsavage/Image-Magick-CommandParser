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

use Types::Standard qw/Any HashRef Str/;

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
	my($self)	= @_;
	#my($bnf)	= get_data_section('image.magick.bnf');
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
	my($image_regexp)		= '^.+\s+(.+?\.(?:' . join('|', split/\n/, get_data_section('image.formats') ) . '))$';
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

		$self -> report($cache);

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
		die "Error: Cannot handle some types of ambiguity\n";
	}

	$self -> result($result[0]);

} # End of _process_ambiguous.

# --------------------------------------------------

sub _process_unambiguous
{
	my($self, $cache, $output_file_name) = @_;
	my($result)	=
	{
		command		=> '',
		input_file	=> '',
		output_file	=> '',
		options		=> [],
	};

	my(@options, @operator);
	my($param);
	my(@stack);

	for my $item ($$cache{items} -> print)
	{
		$param = defined($$item{param}[0]) ? $$item{param}[0] : '';

		if ($$item{rule} eq 'action_set')
		{
			@operator	= ();
			@stack		= ();

			for $param (@{$$item{param} })
			{
				if ($param =~ /^[a-zA-Z][-a-zA-Z]+:/)
				{
					push @operator, $param;
				}
				else
				{
					push @stack, $param;
				}
			}

			if ($#stack >= 0)
			{
				push @options,
				{
					name	=> $$item{rule},
					param	=> [@stack],
				};
			}

			if ($#operator >= 0)
			{
				push @options,
				{
					name	=> 'operator',
					param	=> [@operator],
				};
			}
		}
		elsif ($$item{rule} eq 'command')
		{
			$$result{command} = $param;
		}
		elsif ($$item{rule} eq 'input_file')
		{
			$$result{input_file} = $param;
		}
		elsif ($$item{rule} eq 'operator')
		{
			push @options,
			{
				name	=> $$item{rule},
				param	=> [$param],
			};
		}
		else
		{
			push @options,
			{
				name	=> $$item{rule},
				param	=> $$item{param},
			};
		}
	}

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
	$self -> log(debug => sprintf($format, 'Rule', 'Params') );

	for my $item ($$cache{items} -> print)
	{
		$self -> log(debug => sprintf($format, $$item{rule}, join(', ', @{$$item{param} }) ) );
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
		$self -> report($cache);
		$self -> log(info => "Result: \n" . Dumper($self -> result) );
	}
	else
	{
		$self -> log(warning => 'Warning: Parse is ambiguous');
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
@@ image.magick.bnf
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
