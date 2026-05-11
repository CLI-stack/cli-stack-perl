#!/usr/bin/perl
# LESSON 21: Random Numbers

use strict;
use warnings;
use feature 'say';

# Seed the random number generator (use time for real randomness)
srand(time);

# rand() - random float between 0 and 1
my $r = rand();
say "Random float (0-1): $r";

# rand(N) - random float between 0 and N
my $r2 = rand(100);
say "Random float (0-100): $r2";

# Random integer between 0 and N-1
my $dice = int(rand(6)) + 1;   # 1 to 6
say "Dice roll: $dice";

# Random integer between min and max
sub rand_range {
    my ($min, $max) = @_;
    return int(rand($max - $min + 1)) + $min;
}

say "Random 10-50: " . rand_range(10, 50);

# Roll dice 10 times
say "\n10 dice rolls:";
my @rolls;
for (1..10) {
    push @rolls, int(rand(6)) + 1;
}
say join(", ", @rolls);

# Shuffle an array
use List::Util qw(shuffle);
my @deck = (1..10);
my @shuffled = shuffle(@deck);
say "\nOriginal : " . join(", ", @deck);
say "Shuffled : " . join(", ", @shuffled);
