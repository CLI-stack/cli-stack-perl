#!/usr/bin/perl
# LESSON 34: Iterating Over Hashes
# Different ways to loop through all key-value pairs in a hash

use strict;
use warnings;
use feature 'say';

my %capitals = (
    Malaysia  => "Kuala Lumpur",   # country => capital
    Japan     => "Tokyo",
    France    => "Paris",
    Germany   => "Berlin",
    Australia => "Canberra",
);

# Method 1: foreach over sorted keys (most readable and commonly used)
say "--- Sorted by country ---";
foreach my $country (sort keys %capitals) {        # sort keys alphabetically
    say "  $country => $capitals{$country}";        # access value using the key
}

# Method 2: while with each() - gives one pair per iteration
say "\n--- Using each() ---";
while (my ($country, $capital) = each %capitals) {  # each returns (key, value) pair
    say "  Capital of $country is $capital";
}

# Method 3: iterate values only (when you only need the values)
say "\n--- Capitals only ---";
say "  $_" for sort values %capitals;   # sort and loop through values

# Sort by VALUE instead of key (sort by capital name alphabetically)
say "\n--- Sorted by capital ---";
foreach my $country (sort { $capitals{$a} cmp $capitals{$b} } keys %capitals) {
    # sort block uses $a and $b which hold the keys; compare the VALUES
    say "  $capitals{$country} ($country)";
}

# Find a KEY by searching for a specific VALUE (reverse lookup)
say "\n--- Find country with capital 'Tokyo' ---";
foreach my $country (keys %capitals) {
    if ($capitals{$country} eq "Tokyo") {    # compare each value
        say "  Found: $country";             # print the key (country name)
        last;                                # stop searching once found
    }
}
