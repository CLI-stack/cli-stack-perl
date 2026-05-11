#!/usr/bin/perl
# LESSON 53: Closures - Functions That Remember Their Environment

use strict;
use warnings;
use feature 'say';

# A closure captures variables from its surrounding scope
sub make_counter {
    my $count = 0;   # this variable is "closed over"
    return sub {
        $count++;
        return $count;
    };
}

my $counter1 = make_counter();
my $counter2 = make_counter();   # independent counter

say $counter1->();   # 1
say $counter1->();   # 2
say $counter1->();   # 3
say $counter2->();   # 1 (separate from counter1)
say $counter1->();   # 4

# Closure as accumulator
sub make_adder {
    my $total = 0;
    return {
        add   => sub { $total += shift; $total },
        reset => sub { $total = 0 },
        get   => sub { $total },
    };
}

my $acc = make_adder();
$acc->{add}->(10);
$acc->{add}->(25);
$acc->{add}->(5);
say "Total: " . $acc->{get}->();   # 40
$acc->{reset}->();
say "After reset: " . $acc->{get}->();   # 0

# Closure for memoization (cache results)
sub make_memoized_fib {
    my %cache;
    my $fib;
    $fib = sub {
        my $n = shift;
        return $n if $n <= 1;
        return $cache{$n} //= $fib->($n-1) + $fib->($n-2);
    };
    return $fib;
}

my $fib = make_memoized_fib();
say "fib(30) = " . $fib->(30);   # fast with memoization
