#!/usr/bin/perl
# LESSON 37: Practical - Word Count with Hashes
# A real-world task showing how hashes count occurrences

use strict;
use warnings;
use feature 'say';

my $text = "the cat sat on the mat the cat ate the rat";   # sentence to analyse

# Split text into words and count each one using a hash
my %count;                                    # empty hash to store word counts
for my $word (split /\s+/, $text) {           # split on whitespace to get each word
    $count{$word}++;                          # auto-initialises to 0 then increments
                                              # first time a word is seen: 0+1=1
}                                             # second time: 1+1=2, etc.

# Sort by frequency (most common first), alphabetically if tied
say "Word frequencies:";
for my $word (sort { $count{$b} <=> $count{$a} || $a cmp $b } keys %count) {
    # $count{$b} <=> $count{$a} = descending by count
    # || $a cmp $b              = if counts equal, alphabetical order
    printf "  %-10s : %d\n", $word, $count{$word};  # formatted aligned output
}

say "\nUnique words: " . scalar(keys %count);   # number of distinct words
say "Total words : " . (scalar split /\s+/, $text);   # total words in text

# Find the most common word using sort
my $top = (sort { $count{$b} <=> $count{$a} } keys %count)[0];  # [0] = first after sort
say "Most common : '$top' ($count{$top} times)";

# Find words that appear more than once
my @repeated = grep { $count{$_} > 1 } keys %count;  # grep filters by condition
say "Repeated    : " . join(", ", sort @repeated);

# Visual frequency histogram using string repetition
say "\nHistogram:";
for my $word (sort keys %count) {
    printf "  %-6s : %s\n", $word, "#" x $count{$word};  # "#" x N prints N hashes
}
