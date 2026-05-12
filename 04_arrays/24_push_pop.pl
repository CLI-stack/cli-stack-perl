#!/usr/bin/perl
# LESSON 24: push and pop - Add/Remove from the End of an Array
# Think of it like a stack of plates - you add and remove from the top (end)

use strict;
use warnings;
use feature 'say';

my @stack = ();   # start with an empty array

# push(array, items) - adds one or more items to the END of the array
push @stack, "plate1";                              # array now: ("plate1")
push @stack, "plate2";                              # array now: ("plate1", "plate2")
push @stack, "plate3";                              # array now: ("plate1", "plate2", "plate3")
say "After push: " . join(", ", @stack);            # prints all three

push @stack, "plate4", "plate5";                    # push can add multiple items at once
say "After push x2: " . join(", ", @stack);         # now 5 elements

# pop(array) - removes and RETURNS the LAST element
my $top = pop @stack;                               # removes "plate5" from end
say "Popped: $top";                                 # prints: plate5
say "After pop: " . join(", ", @stack);             # 4 elements remain

# Popping an empty array returns undef (no error)
my @empty   = ();
my $nothing = pop @empty;                           # safe to pop empty array
say "Pop empty: " . (defined $nothing ? $nothing : "undef");  # prints: undef

# LIFO = Last In First Out - the classic stack behaviour
say "\n--- Stack demo (LIFO) ---";
my @todo = ();
push @todo, "task1";   # add task1
push @todo, "task2";   # add task2
push @todo, "task3";   # add task3 (this will be processed first)

while (@todo) {                     # keep looping while array is not empty
    my $task = pop @todo;           # take from the END (last added = first processed)
    say "Processing: $task";        # task3, task2, task1 order
}
