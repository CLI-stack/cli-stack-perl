#!/usr/bin/perl
# LESSON 55: Writing Files

use strict;
use warnings;
use feature 'say';

my $filename = "/tmp/perl_output.txt";

# Write mode '>' - creates or overwrites
open(my $fh, '>', $filename) or die "Cannot open $filename: $!";

print $fh "Hello, File!\n";
print $fh "Line 2\n";
say $fh "Line 3 (using say)";   # say adds newline automatically

# Write multiple lines with a loop
for my $i (1..5) {
    print $fh "Item $i\n";
}

close($fh);
say "Written to $filename";

# Verify by reading back
open($fh, '<', $filename) or die $!;
say "\n--- File contents ---";
print while <$fh>;
close($fh);

# Write a structured report
my $report = "/tmp/report.txt";
open($fh, '>', $report) or die $!;

my @students = (
    {name => "Alice",   score => 95},
    {name => "Bob",     score => 82},
    {name => "Charlie", score => 76},
);

printf $fh "%-12s %6s\n", "Name", "Score";
print  $fh "-" x 20 . "\n";
for my $s (@students) {
    printf $fh "%-12s %6d\n", $s->{name}, $s->{score};
}

close($fh);
say "\n--- Report ---";
open($fh, '<', $report) or die $!;
print while <$fh>;
close($fh);
