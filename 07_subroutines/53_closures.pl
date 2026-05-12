#!/usr/bin/perl
# LESSON 53: Closures - Functions That Remember Their Surrounding Variables
# A closure is a sub that captures and keeps access to variables from its enclosing scope

use strict;
use warnings;
use feature 'say';

# make_counter creates a new independent counter each time it's called
sub make_counter {
    my $count = 0;    # this variable lives INSIDE make_counter's scope
    return sub {      # the returned sub "closes over" $count - it remembers it
        $count++;     # each call to this sub increments its own private $count
        return $count;
    };
}

my $counter1 = make_counter();   # create first counter with its own $count
my $counter2 = make_counter();   # create second counter with a SEPARATE $count

say $counter1->();   # prints: 1 (counter1's count is now 1)
say $counter1->();   # prints: 2
say $counter1->();   # prints: 3
say $counter2->();   # prints: 1 (counter2 is independent - starts at 0)
say $counter1->();   # prints: 4 (counter1 continues from where it left off)

# Closure as a multi-method object using a hash of code refs
sub make_adder {
    my $total = 0;                           # shared state for this accumulator
    return {
        add   => sub { $total += shift; $total },  # add to total, return new total
        reset => sub { $total = 0 },               # reset total to 0
        get   => sub { $total },                   # just read the current total
    };
}

my $acc = make_adder();
$acc->{add}->(10);    # total is now 10
$acc->{add}->(25);    # total is now 35
$acc->{add}->(5);     # total is now 40
say "Total: " . $acc->{get}->();    # prints: 40
$acc->{reset}->();                   # reset back to 0
say "After reset: " . $acc->{get}->();  # prints: 0

# Memoization: use a closure to cache previously computed results
sub make_memoized_fib {
    my %cache;     # cache lives inside this scope - shared by the returned sub
    my $fib;       # declare $fib before assigning so the sub can reference itself
    $fib = sub {
        my $n = shift;
        return $n if $n <= 1;                            # base case
        return $cache{$n} //= $fib->($n-1) + $fib->($n-2);  # use cached or compute and cache
    };
    return $fib;
}

my $fib = make_memoized_fib();
say "fib(30) = " . $fib->(30);   # fast because results are cached in %cache
