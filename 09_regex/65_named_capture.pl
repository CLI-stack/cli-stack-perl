#!/usr/bin/perl
# LESSON 65: split() with Regex and Advanced Splitting
# split() is more powerful when you use regex patterns as the separator

use strict;
use warnings;
use feature 'say';

# Split on whitespace - \s+ matches one or more spaces, tabs, or newlines
my $line  = "one   two\tthree  four";   # mixed spaces and tab
my @words = split /\s+/, $line;          # split wherever whitespace occurs
say "Split on whitespace: " . join("|", @words);   # one|two|three|four

# Problem: leading whitespace creates an empty first element
my $padded = "  leading spaces  ";
my @parts  = split /\s+/, $padded;       # first element is "" (empty before first space)
say "Parts: " . scalar(@parts);          # 3 (empty string, "leading", "spaces")
say "Part[0]: '$parts[0]'";              # '' (empty string - the space before "leading")

# Fix: trim leading whitespace first, then split
$padded =~ s/^\s+|\s+$//g;             # remove both leading and trailing whitespace
@parts  = split /\s+/, $padded;
say "After trim split: " . join("|", @parts);  # leading|spaces (clean)

# Split on multiple possible separator characters using character class
my $data   = "alpha:beta,gamma;delta";
my @fields = split /[:;,]/, $data;    # [abc] matches any ONE of a, b, or c
say "\nMulti-sep split: " . join(" | ", @fields);   # alpha | beta | gamma | delta

# Keep the delimiters by wrapping the separator in a capturing group ()
my $expr   = "10+20-5*3";
my @tokens = split /([\+\-\*\/])/, $expr;  # () around separator keeps it in the results
say "\nExpression tokens: " . join(", ", @tokens);   # 10, +, 20, -, 5, *, 3

# Split into individual characters using empty pattern //
my @chars = split //, "Hello";         # // splits between EVERY character
say "Chars: " . join("-", @chars);     # H-e-l-l-o

# Split a CSV line (simplified - doesn't handle quoted commas)
sub split_csv {
    my $line   = shift;
    my @fields;
    while ($line =~ /("(?:[^"]|"")*"|[^,]*)/g) {   # match quoted or unquoted fields
        my $f = $1;
        $f =~ s/^"|"$//g;          # remove surrounding quotes if present
        push @fields, $f;
        last unless $line =~ /\G,/gc;  # \G = where last match ended; /c = don't reset on fail
    }
    return @fields;
}

my @csv = split_csv('Alice,30,"New York, NY",Engineer');
say "\nCSV fields:";
say "  [$_]: $csv[$_]" for 0..$#csv;
