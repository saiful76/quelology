package Quelology::Model::Result::RawPublicationAttribution;
use parent qw/DBIx::Class::Core/;
use utf8;

__PACKAGE__->table('raw_publication_attribution');
__PACKAGE__->add_columns(
    'id',
    raw_publication_id   => {
        data_type       => 'integer',
        is_nullable     => 0,
        is_foreign_key  => 1,
        is_numeric      => 1,
    },
    name        => {
        data_type       => 'varchar',
        is_nullable     => 0,
    },
    url         => {
        data_type       => 'varchar',
    },
    'retrieved',
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to('raw_publication', 'Quelology::Model::Result::RawPublication', 'raw_publication_id');

1;
