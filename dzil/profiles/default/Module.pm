use strict;
use warnings;
package {{$name}};
# ABSTRACT: TODO: abstract here

sub new {
    my ($class, %args) = @_;
    my $self = bless {
        %args,
    }, $class;
    return $self->init;
}

sub init {
    my $self = shift;

    # TODO: initialize

    return $self;
}

1;
__END__

=head1 NAME

{{$name}} - TODO: abstract here

=head1 DESCRIPTION

TODO:

=head1 SYNOPSIS

TODO:

=head1 METHODS

TODO:

=head1 AUTHOR

{{ join "\n", @{$dist->authors} }}
