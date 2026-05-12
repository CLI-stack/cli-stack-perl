#!/usr/bin/perl
# LESSON 90: Text Processing - Word Counter
# Analyse text to count words, characters, and frequencies

use strict;
use warnings;
use feature 'say';
use List::Util 'sum';   # import sum for averaging

# Heredoc syntax: <<'END_TEXT' ... END_TEXT writes a multi-line string
# The ending label must be at the start of the line (no spaces before it)
my $passage = <<'END_TEXT';
To be or not to be that is the question
Whether tis nobler in the mind to suffer
The slings and arrows of outrageous fortune
Or to take arms against a sea of troubles
END_TEXT

say "=== Text Statistics ===";

# Count lines by splitting on newline
my @lines = split /\n/, $passage;
say "Lines     : " . scalar(@lines);   # number of lines

# Count words by splitting on whitespace
my @words = split /\s+/, $passage;
@words    = grep { length($_) > 0 } @words;   # remove any empty strings from split
say "Words     : " . scalar(@words);

# Count characters excluding spaces
(my $no_spaces = $passage) =~ s/\s//g;      # remove ALL whitespace
say "Chars (no spaces): " . length($no_spaces);
say "Chars (total)    : " . length($passage);

# Build word frequency hash
my %freq;
for my $word (map { lc } @words) {   # lc converts each word to lowercase
    $word =~ s/[^a-z]//g;            # remove non-letter characters (punctuation)
    $freq{$word}++ if length $word;  # increment count (skip empty strings)
}

say "\n=== Top 10 Words ===";
my @sorted = sort { $freq{$b} <=> $freq{$a} || $a cmp $b } keys %freq;
# sort descending by count; alphabetical if counts are equal
for my $word (@sorted[0..9]) {             # [0..9] = first 10 elements
    printf "  %-12s : %d\n", $word, $freq{$word};
}

# Calculate average word length
my @lengths = map { length } @words;      # map returns length of each word
printf "\nAvg word length: %.2f chars\n", sum(@lengths) / scalar(@lengths);

say "Unique words: " . scalar(keys %freq);   # count of distinct words
