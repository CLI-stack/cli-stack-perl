#!/usr/bin/perl
# LESSON 92: Text Processing - CSV File Processor
# Read, parse, filter, and summarise CSV data

use strict;
use warnings;
use feature 'say';

# Create a sample CSV file to work with
my $csvfile = "/tmp/employees.csv";
open(my $out, '>', $csvfile) or die $!;
print $out "Name,Department,Salary,Years\n";     # header row
print $out "Alice,Engineering,85000,5\n";
print $out "Bob,Marketing,62000,3\n";
print $out "Charlie,Engineering,92000,8\n";
print $out "Diana,HR,58000,2\n";
print $out "Eve,Engineering,78000,4\n";
print $out "Frank,Marketing,67000,6\n";
close($out);

# Parse the CSV file
open(my $fh, '<', $csvfile) or die $!;
my $header_line = <$fh>;    # read and store header
chomp $header_line;
my @headers = split /,/, $header_line;   # split header into column names

my @employees;   # will hold one hash ref per employee
while (<$fh>) {
    chomp;                              # remove newline from each line
    my @vals = split /,/;              # split line on commas
    my %emp;
    @emp{@headers} = @vals;            # hash slice: assign each value using header as key
    push @employees, \%emp;            # store the record as a hash reference
}
close($fh);

# Print a formatted table
say "=== Employee Table ===";
printf "%-10s %-12s %8s %5s\n", @headers;   # header row with formatting
say "-" x 42;
for my $e (@employees) {
    printf "%-10s %-12s %8s %5s\n", @{$e}{@headers};  # @{$e}{@headers} = hash slice
}

# Group employees by department
my %by_dept;
for my $e (@employees) {
    push @{$by_dept{$e->{Department}}}, $e;   # add each employee to their dept's array
}

# Summarise each department
say "\n=== Department Summary ===";
for my $dept (sort keys %by_dept) {
    my @emps    = @{$by_dept{$dept}};          # get the array of employees in this dept
    my $total   = 0;
    $total += $_->{Salary} for @emps;           # sum all salaries manually
    my $avg_sal = $total / scalar(@emps);       # divide by headcount
    printf "  %-12s : %d employees, avg salary \$%.0f\n", $dept, scalar(@emps), $avg_sal;
}

# Filter and sort: Engineering team by salary descending
say "\n=== Engineering team (salary desc) ===";
my @eng = sort { $b->{Salary} <=> $a->{Salary} }   # sort descending by salary
          grep { $_->{Department} eq "Engineering" }  # keep only Engineering
          @employees;
printf "  %-10s \$%s\n", $_->{Name}, $_->{Salary} for @eng;
