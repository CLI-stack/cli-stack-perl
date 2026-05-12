#!/usr/bin/perl
# LESSON 64: Regex Modifiers (Flags)
# Flags placed after the closing / change how the regex behaves

use strict;
use warnings;
use feature 'say';

my $text = "Hello World\nSecond Line\nThird Line";   # multiline string

# /i flag - case insensitive matching
say "=== /i flag (case insensitive) ===";
say ($text =~ /hello/i ? "matched" : "no match");   # matches "Hello" with /i

# /g flag - global: find ALL non-overlapping matches
say "\n=== /g flag (all matches) ===";
my @words = ($text =~ /\b\w+\b/g);    # \b = word boundary, \w+ = one or more word chars
say "All words: " . join(", ", @words);

# /m flag - multiline: makes ^ and $ match start/end of EACH LINE (not just whole string)
say "\n=== /m flag (per-line anchors) ===";
while ($text =~ /^(\w+)/mg) {    # ^ with /m matches start of each line
    say "  Line starts with: $1";
}

# /s flag - single-line: makes . (dot) match newlines too (normally dot skips \n)
say "\n=== /s flag (dot matches newline) ===";
if ($text =~ /Hello(.+)Third/s) {   # without /s, . wouldn't cross the newlines
    say "Matched across lines (first 20 chars of capture): '" . substr($1, 0, 20) . "...'";
}

# /x flag - extended: allows whitespace and # comments INSIDE the regex for readability
say "\n=== /x flag (verbose regex with comments) ===";
my $date = "2025-01-15";
if ($date =~ /
    (\d{4})   # capture 4-digit year
    -         # literal hyphen separator
    (\d{2})   # capture 2-digit month
    -         # literal hyphen separator
    (\d{2})   # capture 2-digit day
/x) {         # /x allows whitespace and comments inside regex
    say "year=$1 month=$2 day=$3";
}

# Combine multiple flags
my $html = "<B>Hello</B> and <b>World</b>";
my @tags;
push @tags, $1 while $html =~ /<(\w+)>/gi;  # /gi = global AND case-insensitive
say "\n=== Combined /gi ===";
say "HTML tags found: " . join(", ", @tags);   # B, B, b, b
