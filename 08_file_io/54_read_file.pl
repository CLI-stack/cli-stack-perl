#!/usr/bin/perl
# LESSON 54: Reading Files

use strict;
use warnings;
use feature 'say';

# Create a sample file first
my $filename = "/tmp/perl_lesson_sample.txt";
open(my $fh_write, '>', $filename) or die "Cannot create file: $!";
print $fh_write "Line 1: Hello\nLine 2: World\nLine 3: Perl\n";
close($fh_write);

# Open for reading with '<'
open(my $fh, '<', $filename) or die "Cannot open $filename: $!";

# Method 1: Read line by line (memory efficient)
say "--- Line by line ---";
while (my $line = <$fh>) {
    chomp $line;
    say "Read: '$line'";
}
close($fh);

# Method 2: Read all lines into array
open($fh, '<', $filename) or die $!;
my @lines = <$fh>;
close($fh);
chomp @lines;   # chomp all lines at once

say "\n--- All lines as array ---";
say "Line count: " . scalar(@lines);
say $_ for @lines;

# Method 3: Read entire file as one string (slurp)
open($fh, '<', $filename) or die $!;
my $content = do { local $/; <$fh> };   # undef $/ = slurp mode
close($fh);
say "\n--- Slurp entire file ---";
say length($content) . " characters read";
print $content;
