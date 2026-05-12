#!/usr/bin/perl
# LESSON 33: Hash Operations
# Common things you do with hashes: keys, values, slices, merging

use strict;
use warnings;
use feature 'say';

my %inventory = (
    apple   => 50,    # 50 apples in stock
    banana  => 30,    # 30 bananas
    cherry  => 100,   # 100 cherries
    date    => 20,    # 20 dates
);

# keys() returns a LIST of all keys (order is not guaranteed)
my @items = sort keys %inventory;             # sort alphabetically for consistent output
say "Items: " . join(", ", @items);           # apple, banana, cherry, date

# values() returns a LIST of all values
my @counts = sort { $a <=> $b } values %inventory;  # sort numerically
say "Counts: " . join(", ", @counts);                # 20, 30, 50, 100

# each() returns the next key-value pair on each call (used in while loop)
say "\nInventory:";
while (my ($item, $count) = each %inventory) {   # each() gives one pair at a time
    printf "  %-10s : %d\n", $item, $count;       # formatted output
}

# Merge two hashes by flattening them into a list
my %extra  = (elderberry => 75, fig => 40);   # additional items
my %all    = (%inventory, %extra);            # combine: if same key exists, %extra wins
say "\nMerged item count: " . scalar(keys %all);

# Hash SLICE - get multiple values at once using @hash{key_list}
my @selected = @inventory{qw(apple cherry)};  # qw = list of keys without quotes
say "Apple & Cherry: " . join(", ", @selected);   # 50, 100

# Assign multiple values via hash slice
@inventory{qw(grape mango)} = (60, 45);       # add two new keys at once
say "After add: " . scalar(keys %inventory) . " items";

say "Total item types: " . scalar(keys %inventory);   # scalar(keys) = count of keys
