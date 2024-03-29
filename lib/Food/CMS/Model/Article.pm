package Food::CMS::Model::Article;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'Food::CMS::Schema',
    
    connect_info => {
        dsn => 'create:dynamic',
        user => 'dbi:SQLite:mydb.db',
        password => '',
    }
);

=head1 NAME

Food::CMS::Model::Article - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<Food::CMS>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<Food::CMS::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.59

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
