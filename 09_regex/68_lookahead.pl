#!/usr/bin/perl
# LESSON 68: Extract Data with Regex
# Using regex to pull specific pieces of information out of text

use strict;
use warnings;
use feature 'say';

# Extract all numbers from a sentence
my $text = "There are 12 apples, 5 oranges, and 300 grapes.";
my @nums = ($text =~ /(\d+)/g);       # /g in list context captures ALL matches
say "Numbers found: " . join(", ", @nums);   # 12, 5, 300

# Extract IP addresses from a log line
my $log = "Connection from 192.168.1.100 and 10.0.0.1 rejected 8.8.8.8";
# Pattern: \b = word boundary, \d{1,3} = 1-3 digits, (?:\.\d{1,3}){3} = repeat .digits 3 times
my @ips = ($log =~ /\b(\d{1,3}(?:\.\d{1,3}){3})\b/g);  # (?:...) = non-capturing group
say "IP addresses: " . join(", ", @ips);

# Extract key=value pairs from a config string
my $config = "host=localhost port=3306 user=admin debug=true";
my %settings;
while ($config =~ /(\w+)=(\S+)/g) {   # \w+ = key, \S+ = value (non-whitespace)
    $settings{$1} = $2;               # $1 = key, $2 = value
}
say "\nConfig settings:";
say "  $_ = $settings{$_}" for sort keys %settings;

# Extract HTML tag names and their inner text
my $html = "<h1>Title</h1><p>Paragraph 1</p><p>Paragraph 2</p>";
while ($html =~ /<(\w+)>([^<]*)<\/\1>/g) {   # \1 backreference matches the same tag name
    say "Tag: <$1>, Content: '$2'";            # $1 = tag name, $2 = content
}

# Extract lines matching a pattern (like grep command)
my $multiline = "INFO started\nERROR failed\nINFO running\nERROR timeout\nINFO done";
my @errors;
while ($multiline =~ /^(ERROR .+)$/mg) {   # /m makes ^ and $ match line boundaries
    push @errors, $1;                       # $1 = the full ERROR line
}
say "\nErrors found:";
say "  $_" for @errors;

# Count word frequency using regex in a loop
my $passage = "to be or not to be that is the question";
my %freq;
$freq{$1}++ while $passage =~ /(\w+)/g;   # for each word found, increment its count
say "\nWord frequency (top words):";
printf "  %-10s : %d\n", $_, $freq{$_} for sort { $freq{$b} <=> $freq{$a} } keys %freq;
