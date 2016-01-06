package Image::Magick::CommandParser;

use strict;
use utf8;
use warnings;
use warnings  qw(FATAL utf8);    # Fatalize encoding glitches.

use File::Slurper 'read_lines';

use Image::Magick::CommandParser::Actions;

use Marpa::R2;

use Moo;

use Types::Standard qw/Any Str/;

has grammar =>
(
	default  => sub{return ''},
	is       => 'rw',
	isa      => Any, # 'Marpa::R2::Scanless::G'.
	required => 0,
);

has input_file_name =>
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

	# 1 of 2: Initialize the action class via global variables - Yuk!
	# The point is that we don't create an action instance.
	# Marpa creates one but we can't get our hands on it.

#	$Image::Magick::CommandParser::Actions::logger = $self -> logger;

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

# ------------------------------------------------

sub decode_result
{
	my($self, $result) = @_;
	my(@worklist) = $result;

	my($obj);
	my($ref_type);
	my(@stack);

	do
	{
		$obj      = shift @worklist;
		$ref_type = ref $obj;

		if ($ref_type eq 'ARRAY')
		{
			unshift @worklist, @$obj;
		}
		elsif ($ref_type eq 'HASH')
		{
			push @stack, {%$obj};
		}
		else
		{
			die "Unsupported object type $ref_type\n" if ($ref_type);
		}
	} while (@worklist);

	return [@stack];

} # End of decode_result.

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
	my($self)	= @_;
	my($value)	= 'convert -type test';

	$self -> recce -> read(\$value);

	my($result) = $self -> recce -> value;

	die "Marpa's parse failed\n" if (! defined $result);

	for my $item (@{$self -> decode_result($$result)})
	{
		if ($$item{type} eq 'command')
		{
			$self -> new_item($$item{type}, $$item{name}, '-');

			for my $param (@{$self -> decode_result($$item{value})})
			{
				$self -> new_item($$param{type}, $$param{name}, $$param{value});
			}
		}
		else
		{
			$self -> new_item($$item{type}, $$item{name}, $$item{value});
		}
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
