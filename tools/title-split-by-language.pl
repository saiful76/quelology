use warnings;
use 5.010;
use strict;
use lib 'lib';
use Quelology::Config qw/schema/;
binmode STDOUT, ':encoding(UTF-8)';

my $schema = schema;
$schema->t->search({ 'me.lang' => undef, 'publications.lang' => 'en'},
    {
        join     => 'publications',
    }
)->update({ lang => 'en' });

my $titles = $schema->t->with_different_languages;

while (my $t = $titles->next) {
    say $t->title;
    my @nt = $t->split_by_language;
    say '    ', $_->lang, ' ', $_->title for @nt;
}
