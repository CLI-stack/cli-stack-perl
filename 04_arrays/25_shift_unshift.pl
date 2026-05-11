#!/usr/bin/perl
# LESSON 25: shift, unshift - Add/Remove from Front of Array

use strict;
use warnings;
use feature 'say';

my @queue = ("first", "second", "third");

# unshift - add to FRONT
unshift @queue, "new_first";
say "After unshift: " . join(", ", @queue);

unshift @queue, "a", "b";
say "After unshift x2: " . join(", ", @queue);

# shift - remove from FRONT (returns removed item)
my $front = shift @queue;
say "Shifted out: $front";
say "After shift: " . join(", ", @queue);

# Using as a FIFO queue (First In First Out)
say "\n--- Queue demo ---";
my @line = ();
push  @line, "customer1";   # add to back
push  @line, "customer2";
push  @line, "customer3";

while (@line) {
    my $customer = shift @line;   # remove from front
    say "Serving: $customer";
}

# shift is also used to get subroutine arguments!
sub greet {
    my $name = shift;   # gets first argument from @_
    say "Hello, $name!";
}
greet("Alice");
