#!/usr/bin/perl
# LESSON 69: Regex Cheat Sheet - Common Patterns

use strict;
use warnings;
use feature 'say';

# Anchors
say "--- Anchors ---";
say "starts with digit : " . ("3hello"  =~ /^\d/   ? "yes" : "no");
say "ends with digit   : " . ("hello3"  =~ /\d$/   ? "yes" : "no");
say "word boundary     : " . ("cat cats" =~ /\bcat\b/ ? "yes" : "no");

# Character classes
say "\n--- Character Classes ---";
my $test = "Hello World 123";
say "\\d+ (digits)     : " . join(", ", $test =~ /(\d+)/g);
say "\\w+ (word chars) : " . join(", ", $test =~ /(\w+)/g);
say "\\s+ (whitespace) : count=" . scalar($test =~ /\s+/g);
say "\\D  (non-digit)  : " . join("", $test =~ /(\D)/g);

# Quantifiers
say "\n--- Quantifiers ---";
for my $s ("color", "colour", "colouur") {
    say "'$s' matches colou?r   : " . ($s =~ /colou?r/   ? "yes" : "no");
    say "'$s' matches colou*r   : " . ($s =~ /colou*r/   ? "yes" : "no");
    say "'$s' matches colou+r   : " . ($s =~ /colou+r/   ? "yes" : "no");
    say "'$s' matches colou{1,2}r:" . ($s =~ /colou{1,2}r/? "yes" : "no");
}

# Alternation
say "\n--- Alternation ---";
for my $w (qw(cat dog bird fish)) {
    say "'$w' is pet: " . ($w =~ /^(?:cat|dog|fish)$/ ? "yes" : "no");
}

# Greedy vs non-greedy
my $html = "<b>bold</b> and <i>italic</i>";
say "\n--- Greedy vs Lazy ---";
($html =~ /<(.+)>/)   and say "Greedy  : $1";
($html =~ /<(.+?)>/)  and say "Lazy    : $1";
