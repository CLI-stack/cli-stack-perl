#!/usr/bin/perl
# LESSON 55: Writing Files
# How to create a file and write content to it

use strict;
use warnings;
use feature 'say';

my $filename = "/tmp/perl_output.txt";

# Open in WRITE mode: '>' creates new file or OVERWRITES existing one
open(my $fh, '>', $filename) or die "Cannot open $filename: $!";
# If open fails, die stops the program and shows $! (OS error message)

print $fh "Hello, File!\n";       # print to file by passing filehandle as first arg
print $fh "Line 2\n";
say   $fh "Line 3 (using say)";   # say works with filehandles too - adds newline

# Write multiple lines using a loop
for my $i (1..5) {
    print $fh "Item $i\n";   # write each iteration's output to the file
}

close($fh);          # ALWAYS close the filehandle when done - flushes buffer to disk
say "Written to $filename";

# Verify by reading it back
open($fh, '<', $filename) or die $!;
say "\n--- File contents ---";
print while <$fh>;   # shorthand: print $_ while ($_ = <$fh>)
close($fh);

# Write a formatted report to a file
my $report = "/tmp/report.txt";
open($fh, '>', $report) or die $!;

my @students = (
    {name => "Alice",   score => 95},
    {name => "Bob",     score => 82},
    {name => "Charlie", score => 76},
);

printf $fh "%-12s %6s\n", "Name", "Score";   # printf to file: $fh is first argument
print  $fh "-" x 20 . "\n";                  # separator line
for my $s (@students) {
    printf $fh "%-12s %6d\n", $s->{name}, $s->{score};   # formatted row
}

close($fh);
say "\n--- Report ---";
open($fh, '<', $report) or die $!;
print while <$fh>;    # print all lines
close($fh);
