#!/usr/bin/perl
# LESSON 25: shift and unshift - Add/Remove from the FRONT of an Array
# Opposite of push/pop - these operate on the beginning of the array

use strict;
use warnings;
use feature 'say';

my @queue = ("first", "second", "third");   # start with 3 elements

# unshift(array, items) - adds items to the FRONT (beginning) of the array
unshift @queue, "new_first";                         # adds to front
say "After unshift: " . join(", ", @queue);          # prints: new_first, first, second, third

unshift @queue, "a", "b";                            # add multiple items to front at once
say "After unshift x2: " . join(", ", @queue);       # a, b come before everything else

# shift(array) - removes and RETURNS the FIRST element
my $front = shift @queue;                            # removes and returns "a"
say "Shifted out: $front";                           # prints: a
say "After shift: " . join(", ", @queue);            # one less at front

# FIFO = First In First Out - the classic queue behaviour
say "\n--- Queue demo (FIFO) ---";
my @line = ();
push  @line, "customer1";   # add to BACK of queue
push  @line, "customer2";   # add to BACK of queue
push  @line, "customer3";   # add to BACK of queue

while (@line) {                        # keep looping while queue is not empty
    my $customer = shift @line;        # take from the FRONT (first arrived = first served)
    say "Serving: $customer";          # customer1, customer2, customer3 order
}

# shift is also commonly used inside subroutines to get arguments
sub greet {
    my $name = shift;   # shift @_ by default inside a sub - gets first argument
    say "Hello, $name!";
}
greet("Alice");   # passes "Alice" as the argument
