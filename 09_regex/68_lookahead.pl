#!/usr/bin/perl
# LESSON 68: Extract Data with Regex

use strict;
use warnings;
use feature 'say';

# Extract all numbers from text
my $text = "There are 12 apples, 5 oranges, and 300 grapes.";
my @nums = ($text =~ /(\d+)/g);
say "Numbers: " . join(", ", @nums);

# Extract IP addresses
my $log = "Connection from 192.168.1.100 and 10.0.0.1 rejected 8.8.8.8";
my @ips = ($log =~ /\b(\d{1,3}(?:\.\d{1,3}){3})\b/g);
say "IPs: " . join(", ", @ips);

# Extract key=value pairs
my $config = "host=localhost port=3306 user=admin debug=true";
my %settings;
while ($config =~ /(\w+)=(\S+)/g) {
    $settings{$1} = $2;
}
say "\nConfig settings:";
say "  $_ = $settings{$_}" for sort keys %settings;

# Extract HTML tags and content
my $html = "<h1>Title</h1><p>Paragraph 1</p><p>Paragraph 2</p>";
while ($html =~ /<(\w+)>([^<]*)<\/\1>/g) {
    say "Tag: <$1>, Content: '$2'";
}

# Extract lines matching a pattern (grep-like)
my $multiline = "INFO started\nERROR failed\nINFO running\nERROR timeout\nINFO done";
my @errors;
while ($multiline =~ /^(ERROR .+)$/mg) {
    push @errors, $1;
}
say "\nErrors found:";
say "  $_" for @errors;

# Count word frequency with regex
my $passage = "to be or not to be that is the question";
my %freq;
$freq{$1}++ while $passage =~ /(\w+)/g;
say "\nWord frequency:";
printf "  %-10s : %d\n", $_, $freq{$_} for sort { $freq{$b} <=> $freq{$a} } keys %freq;
