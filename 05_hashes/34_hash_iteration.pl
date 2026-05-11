#!/usr/bin/perl
# LESSON 34: Iterating Over Hashes

use strict;
use warnings;
use feature 'say';

my %capitals = (
    Malaysia    => "Kuala Lumpur",
    Japan       => "Tokyo",
    France      => "Paris",
    Germany     => "Berlin",
    Australia   => "Canberra",
);

# Method 1: foreach over sorted keys (most common)
say "--- Sorted by country ---";
foreach my $country (sort keys %capitals) {
    say "  $country => $capitals{$country}";
}

# Method 2: while with each()
say "\n--- Using each() ---";
while (my ($country, $capital) = each %capitals) {
    say "  Capital of $country is $capital";
}

# Method 3: iterate values
say "\n--- Capitals only ---";
say "  $_" for sort values %capitals;

# Sort by value (capital name)
say "\n--- Sorted by capital ---";
foreach my $country (sort { $capitals{$a} cmp $capitals{$b} } keys %capitals) {
    say "  $capitals{$country} ($country)";
}

# Find key by value
say "\n--- Find country with capital 'Tokyo' ---";
foreach my $country (keys %capitals) {
    if ($capitals{$country} eq "Tokyo") {
        say "  Found: $country";
        last;
    }
}
