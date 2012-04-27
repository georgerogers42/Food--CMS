package Food::CMS::Controller::Articles;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }




sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash(articles => [$c->model("DB::Article")->all],
              postback => $c->uri_for($self->action_for('make')));
}
sub four_oh_five {
    my $c = shift;
    $c->response->status(405);
    $c->response->body("METHOD " . $c->request->method . " NOT ALLOWED");
    return;
}
sub make :Path('new') :Args(0) {
    my ( $self, $c ) = @_;
    if($c->request->method ne "POST"){
        return four_oh_five $c;
    }
    my $title = $c->request->params->{'title'};
    my $body  = $c->request->params->{'body'};
    my $article = $c->model("DB::Article")->new({
        title => $title,
        body  => $body,
    });
    $article->insert;
    $c->response->redirect($c->uri_for($self->action_for('index')));
}

sub delete :Path('delete') :Args(1) {
   my ( $self, $c, $id ) = @_;
   return four_oh_five $c if($c->request->method ne "POST");
   $c->model("DB::Article")->find({ id => $id })->delete;
   $c->response->redirect($c->uri_for($self->action_for("index")));
}


__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 NAME

Food::CMS::Controller::Articles - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=head2 index

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
