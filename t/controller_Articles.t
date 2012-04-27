use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Food::CMS';
use Food::CMS::Controller::Articles;

ok( request('/articles')->is_success, 'Request should succeed' );
done_testing();
