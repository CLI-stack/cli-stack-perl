#!/usr/bin/perl
# LESSON 47: Basic Subroutines (Functions)

use strict;
use warnings;
use feature 'say';

# Define a subroutine with 'sub'
sub greet {
    say "Hello from greet()!";
}

# Call the subroutine
greet();
greet();   # can call multiple times

# Subroutine that returns a value
sub add {
    my ($a, $b) = @_;   # @_ contains all arguments
    return $a + $b;     # explicit return
}

my $result = add(3, 7);
say "3 + 7 = $result";

# Last evaluated expression is returned (implicit return)
sub multiply {
    my ($a, $b) = @_;
    $a * $b;   # no 'return' needed, but explicit is clearer
}

say "4 * 5 = " . multiply(4, 5);

# Calling before definition (forward declaration or just works in Perl)
say "Square of 6: " . square(6);

sub square {
    my $n = shift;   # shift pulls first arg from @_
    return $n * $n;
}

# Subroutine with no return (void)
sub print_line {
    my $char  = shift // "-";
    my $width = shift // 30;
    say $char x $width;
}

print_line();
print_line("=", 20);
print_line("*");
