#!/usr/bin/perl
# LESSON 92: Text Processing - CSV Processor

use strict;
use warnings;
use feature 'say';

# Create sample CSV
my $csvfile = "/tmp/employees.csv";
open(my $out, '>', $csvfile) or die $!;
print $out "Name,Department,Salary,Years\n";
print $out "Alice,Engineering,85000,5\n";
print $out "Bob,Marketing,62000,3\n";
print $out "Charlie,Engineering,92000,8\n";
print $out "Diana,HR,58000,2\n";
print $out "Eve,Engineering,78000,4\n";
print $out "Frank,Marketing,67000,6\n";
close($out);

# Parse CSV
open(my $fh, '<', $csvfile) or die $!;
my $header_line = <$fh>;
chomp $header_line;
my @headers = split /,/, $header_line;

my @employees;
while (<$fh>) {
    chomp;
    my @vals = split /,/;
    my %emp;
    @emp{@headers} = @vals;
    push @employees, \%emp;
}
close($fh);

# Print table
say "=== Employee Table ===";
printf "%-10s %-12s %8s %5s\n", @headers;
say "-" x 42;
for my $e (@employees) {
    printf "%-10s %-12s %8s %5s\n", @{$e}{@headers};
}

# Statistics by department
my %by_dept;
for my $e (@employees) {
    push @{$by_dept{$e->{Department}}}, $e;
}

say "\n=== Department Summary ===";
for my $dept (sort keys %by_dept) {
    my @emps = @{$by_dept{$dept}};
    my $avg_sal = (eval { require List::Util; List::Util::sum(map { $_->{Salary} } @emps) } // 0) / scalar(@emps);
    printf "  %-12s : %d employees, avg salary \$%.0f\n", $dept, scalar(@emps), $avg_sal;
}

# Sort and filter
say "\n=== Engineering team (sorted by salary) ===";
my @eng = sort { $b->{Salary} <=> $a->{Salary} }
          grep { $_->{Department} eq "Engineering" }
          @employees;
printf "  %-10s \$%s\n", $_->{Name}, $_->{Salary} for @eng;
