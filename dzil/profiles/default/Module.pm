use strict;
use warnings;
package {{$name}};
# ABSTRACT: TODO: abstract here

sub new {
    my ($class, %args) = @_;
    my $self = bless {
        %args,
    }, $class;
    return $self->_init;
}

sub _init {
    my $self = shift;
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
