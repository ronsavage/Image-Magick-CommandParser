package Image::Magick::CommandParser::Actions;

use strict;
use warnings;

use Data::Dumper::Concise; # For Dumper().

# Warning: Do not use Moo or anything similar.
# This class needs a sub new() due to the way
# Marpa calls the constructor.

our $VERSION = '1.00';

# ------------------------------------------------

sub action_set
{
	my($cache, @param)	= @_;
	my($name)			= 'action_set';

	$$cache{logger} -> log(debug => "Action: $name");
	$$cache{logger} -> log(debug => Dumper(@param) );

	my(@operator);
	my(@stash);

	for my $item (@param)
	{
		if (ref($item) eq 'ARRAY')
		{
			if ($$item[0] =~ /[-a-zA-Z]+:/)
			{
				push @operator, $item;
			}
			else
			{
				push @stash, $item;
			}
		}
		else
		{
			push @stash, $item;
		}
	}

	$$cache{items} -> push
	({
		param	=> decode_result(\@stash),
		rule	=> $name,
	});

	for my $item (@operator)
	{
		$$cache{items} -> push
		({
			param	=> decode_result(\@operator),
			rule	=> 'operator',
		});
	}

	return $param[0]; # We don't care what's returned!

} # End of action_set.

# ------------------------------------------------

sub close_parenthesis
{
	my($cache, @param)	= @_;
	my($name)			= 'close_parenthesis';

	$$cache{logger} -> log(debug => "Action: $name");
	$$cache{logger} -> log(debug => Dumper(@param) );
	$$cache{items} -> push
	({
		param	=> [$param[0] ],
		rule	=> $name,
	});

	return $param[0]; # We don't care what's returned!

} # End of close_parenthesis.

# ------------------------------------------------

sub command
{
	my($cache, @param)	= @_;
	my($name)			= 'command';

	$$cache{logger} -> log(debug => "Action: $name");
	$$cache{logger} -> log(debug => Dumper(@param) );
	$$cache{items} -> push
	({
		param	=> decode_result(\@param),
		rule	=> $name,
	});

	return $param[0]; # We don't care what's returned!

} # End of command.

# ------------------------------------------------

sub decode_result
{
	my($result) = @_;
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
		else
		{
			push @stack, $obj;
		}
	} while (@worklist);

	return [@stack];

} # End of decode_result.

# ------------------------------------------------

sub input_file
{
	my($cache, @param)	= @_;
	my($name)			= 'input_file';

	$$cache{logger} -> log(debug => "Action: $name");
	$$cache{logger} -> log(debug => Dumper(@param) );
	$$cache{items} -> push
	({
		param  => [$param[0] ],
		rule    => $name,
	});

	return $param[0]; # We don't care what's returned!

} # End of input_file.

# ------------------------------------------------

sub new
{
	my($class) = @_;

	return bless {}, $class;

} # End of new.

# ------------------------------------------------

sub open_parenthesis
{
	my($cache, @param)	= @_;
	my($name)			= 'open_parenthesis';

	$$cache{logger} -> log(debug => "Action: $name");
	$$cache{logger} -> log(debug => Dumper(@param) );
	$$cache{items} -> push
	({
		param	=> [$param[0] ],
		rule	=> $name,
	});

	return $param[0]; # We don't care what's returned!

} # End of open_parenthesis.

# ------------------------------------------------

sub operator
{
	my($cache, @param)	= @_;
	my($name)			= 'operator';

	$$cache{logger} -> log(debug => "Name: $name");
	$$cache{logger} -> log(debug => Dumper(@param) );
	$$cache{items} -> push
	({
		param	=> [$param[0] ],
		rule	=> $name,
	});

	return $param[0]; # We don't care what's returned!

} # End of operator.

# ------------------------------------------------

sub sign
{
	my($cache, @param)	= @_;
	my($name)			= 'sign';

	$$cache{logger} -> log(debug => "Action: $name");
	$$cache{logger} -> log(debug => Dumper(@param) );
	$$cache{items} -> push
	({
		param	=> [$param[0] ],
		rule	=> $name,
	});

	return $param[0]; # We don't care what's returned!

} # End of sign.

# ------------------------------------------------

1;

=pod

=head1 NAME

C<Image::Magick::CommandParser::Actions> - Parse any command line used by ImageMagick

=head1 Synopsis

See L<Image::Magick::CommandParser/Synopsis>.

The module is used automatically by L<Image::Magick::CommandParser> as appropriate.

=head1 Description

See L<Image::Magick::CommandParser/Description>.

=head1 Installation

See L<Image::Magick::CommandParser/Installation>.

=head1 Methods

The functions are called automatically by L<Marpa::R2> as appropriate.

=head2 new()

The constructor is called automatically by L<Marpa::R2> as appropriate.

=head1 Machine-Readable Change Log

The file Changes was converted into Changelog.ini by L<Module::Metadata::Changes>.

=head1 Version Numbers

Version numbers < 1.00 represent development versions. From 1.00 up, they are production versions.

=head1 Support

Email the author, or log a bug on RT:

L<https://rt.cpan.org/Public/Dist/Display.html?Name=Image::Magick::CommandParser>.

=head1 Author

Ron Savage I<E<lt>ron@savage.net.auE<gt>>.

Home page: L<http://savage.net.au/>.

=head1 Copyright

Australian copyright (c) 2016, Ron Savage.

	All Programs of mine are 'OSI Certified Open Source Software';
	you can redistribute them and/or modify them under the terms of
	The Artistic License 2.0, a copy of which is available at:
	http://www.opensource.org/licenses/index.html

=cut
