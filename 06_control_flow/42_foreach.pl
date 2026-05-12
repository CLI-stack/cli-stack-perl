#!/usr/bin/perl
# LESSON 42: foreach Loop
# The most common loop in Perl - iterate through every element of a list

use strict;
use warnings;
use feature 'say';

my @colors = qw(red green blue yellow purple);   # qw = array of words without quotes

# foreach my $var (@array) - loop through every element
foreach my $color (@colors) {    # $color takes each value in turn
    say "Color: $color";          # print each color
}

# IMPORTANT: $_ inside foreach is an ALIAS to the actual element
# Modifying $_ changes the real array element
my @nums = (1, 2, 3, 4, 5);
say "\nOriginal: " . join(", ", @nums);   # 1, 2, 3, 4, 5

foreach (@nums) {        # no variable name = use $_ as alias
    $_ *= 2;             # modify $_ = modify the actual array element
}
say "Doubled : " . join(", ", @nums);   # 2, 4, 6, 8, 10 - ORIGINAL was changed!

# Postfix foreach - one-liner: statement FOREACH list
say "$_!" foreach qw(Hello World Perl);   # prints each with ! on its own line

# Iterate over hash keys with foreach
my %ages = (Alice => 30, Bob => 25, Carol => 35);
say "\nAges:";
foreach my $name (sort keys %ages) {     # sort keys so output is consistent
    say "  $name is $ages{$name}";       # access hash value using the key
}

# Nested foreach - matrix traversal
my @matrix = ([1,2,3], [4,5,6], [7,8,9]);   # array of array references
say "\nMatrix:";
foreach my $row (@matrix) {            # $row is each array reference
    foreach my $val (@$row) {          # @$row dereferences to get the inner array
        printf "%3d", $val;            # print each value with 3-char width
    }
    print "\n";                        # newline after each row
}
