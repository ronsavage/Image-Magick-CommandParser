package Image::Magick::CommandParser;

use Marpa::R2;

use Moo;

use Types::Standard qw/Int/;

has title_x =>
(
	default  => sub{return 0},
	is       => 'rw',
	isa      => Int,
	required => 0,
);

our $VERSION = '1.00';

# ------------------------------------------------

sub run
{
	my($self) = @_;

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
