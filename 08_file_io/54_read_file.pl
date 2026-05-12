#!/usr/bin/perl
# LESSON 54: Reading Files
# How to open a file and read its contents

use strict;
use warnings;
use feature 'say';

# First, create a sample file to read
my $filename = "/tmp/perl_lesson_sample.txt";
open(my $fh_write, '>', $filename) or die "Cannot create file: $!";
# open(filehandle, mode, path): '>' = write mode (creates or overwrites)
# $! = the OS error message if open fails
print $fh_write "Line 1: Hello\nLine 2: World\nLine 3: Perl\n";
close($fh_write);   # always close the file when done writing

# Method 1: Read line by line (best for large files - memory efficient)
open(my $fh, '<', $filename) or die "Cannot open $filename: $!";
# '<' = read mode; $fh = filehandle (the "connection" to the file)

say "--- Line by line ---";
while (my $line = <$fh>) {   # <$fh> reads one line; returns undef at end of file
    chomp $line;              # remove the trailing newline character
    say "Read: '$line'";      # print the line
}
close($fh);   # close when done reading

# Method 2: Read all lines into an array at once
open($fh, '<', $filename) or die $!;
my @lines = <$fh>;    # in list context, <$fh> reads ALL lines at once into an array
close($fh);
chomp @lines;         # chomp works on arrays too - removes newline from every element

say "\n--- All lines as array ---";
say "Line count: " . scalar(@lines);   # number of lines
say $_ for @lines;                     # print each line

# Method 3: Slurp - read entire file into one big string
open($fh, '<', $filename) or die $!;
my $content = do {
    local $/;    # $/ is the input record separator (normally "\n")
                 # local $/; sets it to undef which means "read all at once"
    <$fh>;       # reads the entire file as one string
};
close($fh);
say "\n--- Entire file as string ---";
say length($content) . " characters read";
print $content;   # print the whole file
