#!/usr/bin/perl
# LESSON 47: Basic Subroutines (Functions)
# Subroutines let you package code into a named block you can reuse

use strict;
use warnings;
use feature 'say';

# Define a subroutine with the 'sub' keyword followed by a name and {} block
sub greet {
    say "Hello from greet()!";   # this code runs every time greet() is called
}

greet();   # call the subroutine - runs the code inside the {}
greet();   # call again - code runs a second time

# Subroutine that takes arguments and returns a value
sub add {
    my ($a, $b) = @_;   # @_ is a special array holding all passed arguments
                         # my ($a, $b) = @_ unpacks the first two into named variables
    return $a + $b;      # return sends a value back to the caller
}

my $result = add(3, 7);     # call with two arguments; result assigned to $result
say "3 + 7 = $result";      # prints: 10

# Implicit return - Perl returns the LAST expression evaluated if no 'return'
sub multiply {
    my ($a, $b) = @_;
    $a * $b;   # no 'return' keyword - this expression value is returned automatically
}

say "4 * 5 = " . multiply(4, 5);   # prints: 20

# Subroutines can be called BEFORE they are defined in the file
say "Square of 6: " . square(6);   # called here even though defined below

sub square {
    my $n = shift;   # shift pulls the first element from @_ (same as $n = $_[0])
    return $n * $n;  # return n squared
}

# Subroutine with default argument values using //
sub print_line {
    my $char  = shift // "-";   # if no char given, default to "-"
    my $width = shift // 30;    # if no width given, default to 30
    say $char x $width;          # print the character repeated width times
}

print_line();          # uses defaults: 30 dashes
print_line("=", 20);   # uses provided: 20 equal signs
print_line("*");        # uses provided char, default width
