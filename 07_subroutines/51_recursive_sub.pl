#!/usr/bin/perl
# LESSON 51: Recursive Subroutines

use strict;
use warnings;
use feature 'say';

# Factorial: n! = n * (n-1) * ... * 1
sub factorial {
    my $n = shift;
    return 1 if $n <= 1;
    return $n * factorial($n - 1);
}

say "5!  = " . factorial(5);    # 120
say "10! = " . factorial(10);   # 3628800

# Fibonacci sequence
sub fibonacci {
    my $n = shift;
    return $n if $n <= 1;
    return fibonacci($n - 1) + fibonacci($n - 2);
}

say "\nFibonacci:";
say "fib($_) = " . fibonacci($_) for (0..8);

# Sum of a list (recursive)
sub sum_r {
    return 0 unless @_;
    return shift(@_) + sum_r(@_);
}
say "\nSum 1..5: " . sum_r(1..5);

# Power function
sub power {
    my ($base, $exp) = @_;
    return 1 if $exp == 0;
    return $base * power($base, $exp - 1);
}
say "\n2^10 = " . power(2, 10);

# Flatten nested arrays (recursive)
sub flatten {
    map { ref $_ eq 'ARRAY' ? flatten(@$_) : $_ } @_;
}

my @nested = (1, [2, 3, [4, 5]], 6, [7, [8, 9]]);
my @flat = flatten(@nested);
say "\nFlattened: " . join(", ", @flat);
