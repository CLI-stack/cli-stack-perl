#!/usr/bin/perl
# LESSON 21: Random Numbers
# How to generate random numbers for games, simulations, and testing

use strict;
use warnings;
use feature 'say';
use List::Util qw(shuffle);   # import shuffle to randomise arrays

srand(time);   # seed the random number generator using current time
               # this ensures different results each run

my $r = rand();        # rand() with no argument = random float between 0.0 and 1.0
say "Random float (0-1): $r";

my $r2 = rand(100);    # rand(N) = random float between 0.0 and N (not including N)
say "Random float (0-100): $r2";

my $dice = int(rand(6)) + 1;   # rand(6) gives 0.0 to 5.999; int() truncates to 0-5; +1 gives 1-6
say "Dice roll: $dice";         # simulates rolling a 6-sided die

# Subroutine to get a random integer between min and max (inclusive)
sub rand_range {
    my ($min, $max) = @_;              # get the min and max values from arguments
    return int(rand($max - $min + 1)) + $min;  # scale rand to the range then shift up
}

say "Random 10-50: " . rand_range(10, 50);   # random number between 10 and 50

# Roll a dice 10 times and collect results
say "\n10 dice rolls:";
my @rolls;                             # empty array to collect results
for (1..10) {                          # loop 10 times (1..10 = range 1 to 10)
    push @rolls, int(rand(6)) + 1;    # add each roll to the array
}
say join(", ", @rolls);                # print all rolls separated by commas

# shuffle() randomises the order of an array
my @deck     = (1..10);               # ordered array: 1, 2, 3, ..., 10
my @shuffled = shuffle(@deck);        # shuffle() returns a new randomly ordered array
say "\nOriginal : " . join(", ", @deck);
say "Shuffled : " . join(", ", @shuffled);
