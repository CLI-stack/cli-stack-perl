#!/usr/bin/perl
# LESSON 65: split with Regex

use strict;
use warnings;
use feature 'say';

# split on regex pattern
my $line = "one   two\tthree  four";
my @words = split /\s+/, $line;
say "Split on whitespace: " . join("|", @words);

# Split and handle leading whitespace
my $padded = "  leading spaces  ";
my @parts = split /\s+/, $padded;
# First element may be empty string
say "Parts: " . scalar(@parts);
say "Part[0]: '$parts[0]'";

# Better: trim first
$padded =~ s/^\s+|\s+$//g;
@parts = split /\s+/, $padded;
say "After trim split: " . join("|", @parts);

# Split on multiple possible separators
my $data = "alpha:beta,gamma;delta";
my @fields = split /[:;,]/, $data;
say "\nMulti-sep split: " . join(" | ", @fields);

# Keep the delimiters using capturing group
my $expr = "10+20-5*3";
my @tokens = split /([\+\-\*\/])/, $expr;
say "\nExpression tokens: " . join(", ", @tokens);

# Split into individual characters
my @chars = split //, "Hello";
say "Chars: " . join("-", @chars);

# Split CSV respecting quotes (simplified)
sub split_csv {
    my $line = shift;
    my @fields;
    while ($line =~ /("(?:[^"]|"")*"|[^,]*)/g) {
        my $f = $1;
        $f =~ s/^"|"$//g;
        push @fields, $f;
        last unless $line =~ /\G,/gc;
    }
    return @fields;
}

my @csv = split_csv('Alice,30,"New York, NY",Engineer');
say "\nCSV fields:";
say "  [$_]: $csv[$_]" for 0..$#csv;
