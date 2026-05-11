#!/usr/bin/perl
# LESSON 42: foreach Loop

use strict;
use warnings;
use feature 'say';

my @colors = qw(red green blue yellow purple);

# foreach - iterate over a list (for and foreach are interchangeable)
foreach my $color (@colors) {
    say "Color: $color";
}

# Modifying elements (uses $_ by default)
my @nums = (1, 2, 3, 4, 5);
say "\nOriginal: " . join(", ", @nums);

foreach (@nums) {
    $_ *= 2;   # $_ is an ALIAS to the actual element!
}
say "Doubled : " . join(", ", @nums);

# Postfix foreach
say "$_!" foreach qw(Hello World Perl);

# Process hash with foreach
my %ages = (Alice => 30, Bob => 25, Carol => 35);
say "\nAges:";
foreach my $name (sort keys %ages) {
    say "  $name is $ages{$name}";
}

# Nested foreach
my @matrix = ([1,2,3], [4,5,6], [7,8,9]);
say "\nMatrix:";
foreach my $row (@matrix) {
    foreach my $val (@$row) {
        printf "%3d", $val;
    }
    print "\n";
}
