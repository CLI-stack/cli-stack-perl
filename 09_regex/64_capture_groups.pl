#!/usr/bin/perl
# LESSON 64: Regex Modifiers and Flags

use strict;
use warnings;
use feature 'say';

my $text = "Hello World\nSecond Line\nThird Line";

# /i - case insensitive
say "Case insensitive:";
say "  " . ($text =~ /hello/i ? "matched" : "no match");

# /g - global (find all)
my @words = ($text =~ /\b\w+\b/g);
say "\n/g all words: " . join(", ", @words);

# /m - multiline (^ and $ match each line)
say "\n/m per-line anchors:";
while ($text =~ /^(\w+)/mg) {
    say "  Line starts with: $1";
}

# /s - single-line mode (. matches newline too)
if ($text =~ /Hello(.+)Third/s) {
    say "\n/s dot matches newline - captured: '" . substr($1,0,20) . "...'";
}

# /x - extended mode (allows whitespace and comments in regex)
my $date = "2025-01-15";
if ($date =~ /
    (\d{4})   # year
    -
    (\d{2})   # month
    -
    (\d{2})   # day
/x) {
    say "\n/x verbose regex: year=$1 month=$2 day=$3";
}

# Combine flags
my $html = "<B>Hello</B> and <b>World</b>";
my @tags;
push @tags, $1 while $html =~ /<(\w+)>/gi;
say "\nHTML tags found: " . join(", ", @tags);
