#!/usr/bin/perl
# LESSON 51: Recursive Subroutines
# A subroutine that calls ITSELF to solve a problem by breaking it into smaller parts

use strict;
use warnings;
use feature 'say';

# Factorial: n! = n * (n-1) * (n-2) * ... * 1
# e.g. 5! = 5 * 4 * 3 * 2 * 1 = 120
sub factorial {
    my $n = shift;                    # get the number to compute factorial of
    return 1 if $n <= 1;             # BASE CASE: stop recursion at 0 or 1 (0!=1, 1!=1)
    return $n * factorial($n - 1);   # RECURSIVE CASE: n! = n * (n-1)!
}

say "5!  = " . factorial(5);    # 5*4*3*2*1 = 120
say "10! = " . factorial(10);   # 3628800

# Fibonacci: each number = sum of the two before it (0,1,1,2,3,5,8,13...)
sub fibonacci {
    my $n = shift;
    return $n if $n <= 1;                              # base case: fib(0)=0, fib(1)=1
    return fibonacci($n - 1) + fibonacci($n - 2);     # recursive case
}

say "\nFibonacci sequence:";
say "fib($_) = " . fibonacci($_) for (0..8);   # compute first 9 fibonacci numbers

# Recursive sum of a list
sub sum_r {
    return 0 unless @_;               # base case: empty list sums to 0
    return shift(@_) + sum_r(@_);    # add first element to recursive sum of the rest
}
say "\nSum 1..5: " . sum_r(1..5);   # 1+2+3+4+5 = 15

# Power function (base raised to exponent)
sub power {
    my ($base, $exp) = @_;
    return 1 if $exp == 0;                     # base case: anything to the power 0 = 1
    return $base * power($base, $exp - 1);    # recursive case: base^n = base * base^(n-1)
}
say "\n2^10 = " . power(2, 10);   # 1024

# Flatten nested arrays recursively
sub flatten {
    map { ref $_ eq 'ARRAY' ? flatten(@$_) : $_ } @_;  # if element is array ref, recurse into it
}                                                         # otherwise keep the element as-is

my @nested = (1, [2, 3, [4, 5]], 6, [7, [8, 9]]);       # deeply nested array
my @flat   = flatten(@nested);                            # recursively flatten all levels
say "\nFlattened: " . join(", ", @flat);                  # 1, 2, 3, 4, 5, 6, 7, 8, 9
