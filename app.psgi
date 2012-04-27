use strict;
use warnings;
use lib 'lib';
use Food::CMS;

my $app = Food::CMS->apply_default_middlewares(Food::CMS->psgi_app);
$app;

