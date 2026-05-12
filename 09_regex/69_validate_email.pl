#!/usr/bin/perl
# LESSON 69: Regex Cheat Sheet - All the Key Patterns in One Place
# Quick reference for the most important regex elements

use strict;
use warnings;
use feature 'say';

# ANCHORS - position markers (don't match characters, match positions)
say "=== Anchors ===";
say "starts with digit : " . ("3hello"  =~ /^\d/    ? "yes" : "no");  # ^ = start of string
say "ends with digit   : " . ("hello3"  =~ /\d$/    ? "yes" : "no");  # $ = end of string
say "whole word 'cat'  : " . ("cat cats" =~ /\bcat\b/ ? "yes" : "no"); # \b = word boundary

# CHARACTER CLASSES - match specific types of characters
say "\n=== Character Classes ===";
my $test = "Hello World 123";
say "\\d+ (digits)      : " . join(", ", $test =~ /(\d+)/g);   # \d = any digit 0-9
say "\\w+ (word chars)  : " . join(", ", $test =~ /(\w+)/g);   # \w = letter, digit, underscore
say "\\s  (whitespace)  : count=" . scalar($test =~ /\s+/g);   # \s = space, tab, newline
say "\\D  (non-digits)  : " . join("", $test =~ /(\D)/g);      # \D = NOT a digit

# QUANTIFIERS - how many times to match
say "\n=== Quantifiers ===";
for my $s ("color", "colour", "colouur") {
    say "'$s' ?  (0 or 1)     : " . ($s =~ /colou?r/    ? "yes" : "no");  # u? = u zero or one times
    say "'$s' *  (0 or more)  : " . ($s =~ /colou*r/    ? "yes" : "no");  # u* = u any times
    say "'$s' +  (1 or more)  : " . ($s =~ /colou+r/    ? "yes" : "no");  # u+ = u at least once
    say "'$s' {1,2} (1 to 2)  : " . ($s =~ /colou{1,2}r/? "yes" : "no"); # {n,m} = n to m times
}

# ALTERNATION - match one thing OR another
say "\n=== Alternation ===";
for my $w (qw(cat dog bird fish)) {
    say "'$w' is a pet: " . ($w =~ /^(?:cat|dog|fish)$/ ? "yes" : "no");
    # | = OR; (?:) = non-capturing group to contain the OR
}

# GREEDY vs LAZY matching
my $html = "<b>bold</b> and <i>italic</i>";
say "\n=== Greedy vs Lazy ===";
($html =~ /<(.+)>/)   and say "Greedy  matches: $1";  # .+ is greedy - matches as MUCH as possible
($html =~ /<(.+?)>/)  and say "Lazy    matches: $1";  # .+? is lazy  - matches as LITTLE as possible
