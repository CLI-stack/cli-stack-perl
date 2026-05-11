#!/usr/bin/perl
# LESSON 90: Text Processing - Word Counter

use strict;
use warnings;
use feature 'say';

my $passage = <<'END_TEXT';
To be or not to be that is the question
Whether tis nobler in the mind to suffer
The slings and arrows of outrageous fortune
Or to take arms against a sea of troubles
END_TEXT

say "=== Text Statistics ===";

# Line count
my @lines = split /\n/, $passage;
say "Lines     : " . scalar(@lines);

# Word count
my @words = split /\s+/, $passage;
@words = grep { length($_) > 0 } @words;
say "Words     : " . scalar(@words);

# Character count (no spaces)
(my $no_spaces = $passage) =~ s/\s//g;
say "Chars(no sp): " . length($no_spaces);
say "Chars(total): " . length($passage);

# Word frequency
my %freq;
for my $word (map { lc } @words) {
    $word =~ s/[^a-z]//g;   # remove punctuation
    $freq{$word}++ if length $word;
}

# Top 10 most frequent
say "\n=== Top 10 Words ===";
my @sorted = sort { $freq{$b} <=> $freq{$a} || $a cmp $b } keys %freq;
for my $word (@sorted[0..9]) {
    printf "  %-12s : %d\n", $word, $freq{$word};
}

# Average word length
use List::Util 'sum';
my @lengths = map { length } @words;
printf "\nAvg word length: %.2f chars\n", sum(@lengths) / scalar(@lengths);

# Unique words
say "Unique words: " . scalar(keys %freq);
