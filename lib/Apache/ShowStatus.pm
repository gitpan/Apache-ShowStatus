package Apache::ShowStatus;

use 5.008;
use strict;
use warnings;
no warnings qw(uninitialized);

use Sys::Proctitle ();
use Apache::RequestRec ();
use Apache::RequestUtil ();
use Apache::Const -compile => qw(DECLINED);

our $VERSION = '0.01';

sub handler {
  my $r=shift;

  $r->pnotes( 'ProctitleObject'=>
	      Sys::Proctitle->new( 'httpd: '.$r->the_request ) );

  return Apache::DECLINED;
}

1;

__END__

=head1 NAME

Apache::ShowStatus - if you want to know what your Apache processes are doing

=head1 SYNOPSIS

 LoadModule perl_module ".../mod_perl.so"
 PerlModule Apache::ShowStatus
 PerlInitHandler Apache::ShowStatus

=head1 DESCRIPTION

This module provides a C<PerlInitHandler> that sets the apache's
process title to

 "httpd: ".$r->the_request

The process title is automagically reset when the request is over.

Thus, C<top> & Co shows what requests are currently active.

=head1 SEE ALSO

L<Sys::Proctitle>

=head1 AUTHOR

Torsten Foertsch, E<lt>torsten.foertsch@gmx.netE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Torsten Foertsch

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut
