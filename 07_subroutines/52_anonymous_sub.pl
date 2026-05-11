#!/usr/bin/perl
# LESSON 52: Anonymous Subroutines (Code References)

use strict;
use warnings;
use feature 'say';

# Anonymous sub stored in a scalar
my $greet = sub {
    my $name = shift;
    say "Hello, $name!";
};

# Call with ->() or &$greet()
$greet->("Alice");
$greet->("Bob");

# Store multiple behaviors in a hash
my %actions = (
    add  => sub { $_[0] + $_[1] },
    sub  => sub { $_[0] - $_[1] },
    mul  => sub { $_[0] * $_[1] },
    div  => sub { $_[1] != 0 ? $_[0] / $_[1] : "error" },
);

my ($x, $y) = (10, 3);
for my $op (sort keys %actions) {
    printf "  %s(%d, %d) = %s\n", $op, $x, $y, $actions{$op}->($x, $y);
}

# Pass a sub as argument (callbacks)
sub apply_to_all {
    my ($func, @list) = @_;
    return map { $func->($_) } @list;
}

my @nums   = (1..5);
my @sq     = apply_to_all(sub { $_[0] ** 2 }, @nums);
my @upper  = apply_to_all(sub { uc $_[0]   }, qw(hello world));

say "\nSquared: " . join(", ", @sq);
say "Upper  : " . join(", ", @upper);

# Return a sub from a sub (factory pattern)
sub make_multiplier {
    my $factor = shift;
    return sub { $_[0] * $factor };
}

my $double = make_multiplier(2);
my $triple = make_multiplier(3);
say "\nDouble 7: " . $double->(7);
say "Triple 7: " . $triple->(7);
