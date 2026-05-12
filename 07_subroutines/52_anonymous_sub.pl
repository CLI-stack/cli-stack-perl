#!/usr/bin/perl
# LESSON 52: Anonymous Subroutines (Code References)
# Subroutines without names - stored in variables and passed around like data

use strict;
use warnings;
use feature 'say';

# An anonymous sub has no name - it's a 'sub { }' stored in a scalar variable
my $greet = sub {
    my $name = shift;        # get the argument
    say "Hello, $name!";     # print greeting
};                           # note the semicolon - this is an assignment statement

$greet->("Alice");   # call with ->() arrow syntax
$greet->("Bob");     # call again with a different argument

# Store multiple behaviours in a hash (dispatch table)
my %actions = (
    add  => sub { $_[0] + $_[1] },   # $_[0] and $_[1] = first and second args
    sub  => sub { $_[0] - $_[1] },   # each value is an anonymous sub
    mul  => sub { $_[0] * $_[1] },
    div  => sub { $_[1] != 0 ? $_[0] / $_[1] : "error" },  # guard against /0
);

my ($x, $y) = (10, 3);
for my $op (sort keys %actions) {
    printf "  %s(%d, %d) = %s\n", $op, $x, $y, $actions{$op}->($x, $y);
    # $actions{$op} retrieves the code ref; ->() calls it with arguments
}

# Pass a sub AS AN ARGUMENT to another sub (callback pattern)
sub apply_to_all {
    my ($func, @list) = @_;        # first arg is a code ref, rest is data
    return map { $func->($_) } @list;  # apply the function to each element
}

my @nums  = (1..5);
my @sq    = apply_to_all(sub { $_[0] ** 2   }, @nums);   # square each
my @upper = apply_to_all(sub { uc $_[0]     }, qw(hello world));  # uppercase each

say "\nSquared: " . join(", ", @sq);
say "Upper  : " . join(", ", @upper);

# FACTORY pattern: a sub that RETURNS another sub
sub make_multiplier {
    my $factor = shift;           # capture the factor in this sub's scope
    return sub { $_[0] * $factor };  # returned sub uses $factor from outer scope
}

my $double = make_multiplier(2);   # creates a "double" function
my $triple = make_multiplier(3);   # creates a "triple" function
say "\nDouble 7: " . $double->(7);  # 14
say "Triple 7: " . $triple->(7);   # 21
