#!/usr/bin/perl
# LESSON 58: Processing Files Line by Line
# Read structured data files and build data structures from them

use strict;
use warnings;
use feature 'say';

# Create a CSV test file with student records
my $datafile = "/tmp/students.csv";
open(my $out, '>', $datafile) or die $!;
print $out "Name,Age,Score,City\n";         # header row
print $out "Alice,22,95,Kuala Lumpur\n";
print $out "Bob,25,82,Penang\n";
print $out "Charlie,20,76,Johor Bahru\n";
print $out "Diana,23,91,Kuching\n";
print $out "Eve,24,88,Kota Kinabalu\n";
close($out);

open(my $fh, '<', $datafile) or die "Cannot open: $!";

my $header_line = <$fh>;    # read the FIRST line (header) separately from data
chomp $header_line;          # remove its newline
my @cols = split(/,/, $header_line);   # split header into column names
say "Columns: " . join(" | ", @cols);
say "-" x 50;

my @records;   # array to collect all parsed records
while (my $line = <$fh>) {
    chomp $line;                         # remove trailing newline from each line
    next if $line =~ /^\s*$/;           # skip blank lines (^\s*$ = only whitespace)
    next if $line =~ /^#/;             # skip comment lines starting with #

    my @fields = split(/,/, $line);     # split line into individual field values
    my %row;
    @row{@cols} = @fields;             # hash slice: assign fields using column names as keys
    push @records, \%row;              # store hash reference in the records array

    printf "%-10s age=%-3s score=%-3s city=%s\n",
        $row{Name}, $row{Age}, $row{Score}, $row{City};
}
close($fh);

# Summary statistics
say "\n--- Summary ---";
say "Total students : " . scalar(@records);

# Calculate average score using eval to safely load List::Util
my $avg = (eval { require List::Util; List::Util::sum(map { $_->{Score} } @records) } // 0)
          / scalar(@records);
printf "Average score  : %.1f\n", $avg;

my @passed = grep { $_->{Score} >= 80 } @records;  # filter students with score >= 80
say "Passed (>=80)  : " . scalar(@passed);
