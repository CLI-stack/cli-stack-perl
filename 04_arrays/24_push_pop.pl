#!/usr/bin/perl
# LESSON 24: push, pop - Add/Remove from End of Array

use strict;
use warnings;
use feature 'say';

my @stack = ();   # think of it like a stack of plates

# push - add to END
push @stack, "plate1";
push @stack, "plate2";
push @stack, "plate3";
say "After push: " . join(", ", @stack);

# push multiple items at once
push @stack, "plate4", "plate5";
say "After push x2: " . join(", ", @stack);

# pop - remove from END (returns the removed item)
my $top = pop @stack;
say "Popped: $top";
say "After pop: " . join(", ", @stack);

# pop an empty array = undef
my @empty = ();
my $nothing = pop @empty;
say "Pop empty: " . (defined $nothing ? $nothing : "undef");

# Using as a LIFO stack (Last In First Out)
say "\n--- Stack demo ---";
my @todo = ();
push @todo, "task1";
push @todo, "task2";
push @todo, "task3";

while (@todo) {
    my $task = pop @todo;
    say "Processing: $task";
}
