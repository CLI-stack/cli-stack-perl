#!/usr/bin/perl
# LESSON 58: Processing Files Line by Line

use strict;
use warnings;
use feature 'say';

# Create a CSV-like test file
my $datafile = "/tmp/students.csv";
open(my $out, '>', $datafile) or die $!;
print $out "Name,Age,Score,City\n";
print $out "Alice,22,95,Kuala Lumpur\n";
print $out "Bob,25,82,Penang\n";
print $out "Charlie,20,76,Johor Bahru\n";
print $out "Diana,23,91,Kuching\n";
print $out "Eve,24,88,Kota Kinabalu\n";
close($out);

# Read and process line by line
open(my $fh, '<', $datafile) or die "Cannot open: $!";

my $header = <$fh>;   # read header separately
chomp $header;
my @cols = split(/,/, $header);
say "Columns: " . join(" | ", @cols);
say "-" x 50;

my @records;
while (my $line = <$fh>) {
    chomp $line;
    next if $line =~ /^\s*$/;   # skip blank lines
    next if $line =~ /^#/;      # skip comments

    my @fields = split(/,/, $line);
    my %row;
    @row{@cols} = @fields;      # map column names to values
    push @records, \%row;

    printf "%-10s age=%-3s score=%-3s city=%s\n",
        $row{Name}, $row{Age}, $row{Score}, $row{City};
}
close($fh);

# Summary
say "\n--- Summary ---";
say "Total students : " . scalar(@records);
my $avg = (eval { require List::Util; List::Util::sum(map { $_->{Score} } @records) } // 0) / scalar(@records);
printf "Average score  : %.1f\n", $avg;

my @passed = grep { $_->{Score} >= 80 } @records;
say "Passed (>=80)  : " . scalar(@passed);
