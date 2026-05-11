#!/usr/bin/perl
# LESSON 37: Practical - Word Count with Hashes

use strict;
use warnings;
use feature 'say';

my $text = "the cat sat on the mat the cat ate the rat";

# Split into words and count each
my %count;
for my $word (split /\s+/, $text) {
    $count{$word}++;   # auto-initializes to 0, then increments
}

# Sort by frequency (descending), then alphabetically
say "Word frequencies:";
for my $word (sort { $count{$b} <=> $count{$a} || $a cmp $b } keys %count) {
    printf "  %-10s : %d\n", $word, $count{$word};
}

# Total unique words
say "\nUnique words: " . scalar(keys %count);
say "Total words : " . (scalar split /\s+/, $text);

# Find the most common word
my $top = (sort { $count{$b} <=> $count{$a} } keys %count)[0];
say "Most common : '$top' ($count{$top} times)";

# Words that appear more than once
my @repeated = grep { $count{$_} > 1 } keys %count;
say "Repeated    : " . join(", ", sort @repeated);

# Frequency histogram
say "\nHistogram:";
for my $word (sort keys %count) {
    printf "  %-6s : %s\n", $word, "#" x $count{$word};
}
