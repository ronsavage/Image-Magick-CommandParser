package Image::Magick::CommandParser;

use strict;
use utf8;
use warnings;
use warnings  qw(FATAL utf8);    # Fatalize encoding glitches.

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
	default  => sub{return Set::Array -> new},
	is       => 'rw',
	isa      => Object,
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

	my(@bnf) = read_lines('data/command.line.options.bnf');

	$self -> grammar
	(
		Marpa::R2::Scanless::G -> new({source => \join("\n", @bnf)})
	);

	$self -> recce
	(
		Marpa::R2::Scanless::R -> new
		({
			grammar           => $self -> grammar,
			semantics_package => 'Image::Magick::CommandParser::Actions',
		})
	);

} # End of BUILD.

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
	my($self)		= @_;
	my($command)	= $self -> command;

	$self -> log(debug => "Command: '$command'");

	my($cache)	=
	{
		logger	=> $self -> logger,
		items	=> $self -> items,
		self	=> $self, # For access to logger within decode_result().
	};

	$self -> recce -> read(\$command);

	my($result)				= $self -> recce -> value($cache);
	my($ambiguity_metric)	= $self -> recce -> ambiguity_metric;

	if ($ambiguity_metric <= 0)
	{
		my($line, $column)	= $self -> recce -> line_column();
		my($whole_length)	= length $command;
		my($suffix)			= substr($command, ($whole_length - 100) );
		my($suffix_length)	= length $suffix;
		my($s)				= $suffix_length == 1 ? 'char' : "$suffix_length chars";
		my($message)		= "Call to ambiguity_metric() returned $ambiguity_metric (i.e. an error). \n"
			. "Marpa exited at (line, column) = ($line, $column) within the input string. \n"
			. "Input length: $whole_length. Last $s of input: '$suffix'";

		$self -> log(error => "Parse failed. $message");
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
		$self -> log(error => 'Parse is ambiguous');
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
