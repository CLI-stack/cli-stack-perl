#!/usr/bin/perl
# LESSON 33: Hash Operations

use strict;
use warnings;
use feature 'say';

my %inventory = (
    apple   => 50,
    banana  => 30,
    cherry  => 100,
    date    => 20,
);

# keys() - returns list of all keys
my @items = sort keys %inventory;
say "Items: " . join(", ", @items);

# values() - returns list of all values
my @counts = sort { $a <=> $b } values %inventory;
say "Counts: " . join(", ", @counts);

# each() - iterate key-value pairs
say "\nInventory:";
while (my ($item, $count) = each %inventory) {
    printf "  %-10s : %d\n", $item, $count;
}

# Merge two hashes
my %extra = (elderberry => 75, fig => 40);
my %all    = (%inventory, %extra);
say "\nMerged count: " . scalar(keys %all);

# Hash slice - get multiple values at once
my @selected = @inventory{qw(apple cherry)};
say "Apple & Cherry: " . join(", ", @selected);

# Assign via hash slice
@inventory{qw(grape mango)} = (60, 45);
say "After add: " . scalar(keys %inventory) . " items";

# Count elements
say "Total items: " . scalar(keys %inventory);
