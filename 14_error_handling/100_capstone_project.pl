#!/usr/bin/perl
# LESSON 100: CAPSTONE - Mini Student Grade Manager
# This script combines ALL topics covered in this curriculum:
# variables, arrays, hashes, control flow, subroutines,
# file I/O, regex, references, modules, and error handling

use strict;        # require all variables to be declared
use warnings;      # warn on risky code
use feature 'say'; # enable say()
use List::Util qw(sum min max);  # math helpers for statistics
use POSIX qw(floor);              # floor() for rounding

my $datafile = "/tmp/grades.csv";   # file path for persisting student data

# ============================================================
# SUBROUTINES - defined before main code for clarity
# ============================================================

# Load student records from a CSV file
sub load_students {
    my $file = shift;
    return [] unless -f $file;   # return empty array ref if file doesn't exist

    open(my $fh, '<', $file) or die "Cannot read $file: $!\n";
    my @students;
    my $header = <$fh>;   # skip the header line (don't process it as data)
    while (<$fh>) {
        chomp;                                # remove newline
        next if /^\s*$/ || /^#/;            # skip blank lines and comments
        my ($name, $id, @scores) = split /,/;  # split CSV into fields
        push @students, {                    # create a hash ref for each student
            name   => $name,
            id     => $id,
            scores => \@scores,              # store scores as an array reference
        };
    }
    close $fh;
    return \@students;   # return array ref of hash refs
}

# Save student records to a CSV file
sub save_students {
    my ($file, $students) = @_;              # get filename and array ref of students
    open(my $fh, '>', $file) or die "Cannot write $file: $!\n";
    print $fh "Name,ID,Math,Science,English,History\n";   # write header
    for my $s (@$students) {                              # loop through each student hash ref
        print $fh join(",", $s->{name}, $s->{id}, @{$s->{scores}}) . "\n";
        # join fields with comma; @{$s->{scores}} dereferences the scores array ref
    }
    close $fh;
}

# Calculate the average of a student's scores
sub calculate_average {
    my @scores = @{ shift->{scores} };       # shift gets the student hash ref; deref scores
    return @scores ? sum(@scores) / scalar(@scores) : 0;  # avoid /0 if no scores
}

# Convert average score to letter grade
sub get_grade {
    my $avg = shift;
    return "A+" if $avg >= 95;   # chain of comparisons from highest to lowest
    return "A"  if $avg >= 90;
    return "A-" if $avg >= 85;
    return "B+" if $avg >= 80;
    return "B"  if $avg >= 75;
    return "B-" if $avg >= 70;
    return "C"  if $avg >= 60;
    return "F";                  # anything below 60 is failing
}

# Print a formatted grade report table
sub print_report {
    my $students = shift;   # array ref of student hash refs

    say "=" x 65;
    say " STUDENT GRADE REPORT";
    say "=" x 65;
    printf "%-15s %-8s  %5s %5s %5s %5s | %6s %3s\n",
        "Name", "ID", "Math", "Sci", "Eng", "His", "Avg", "Grd";
    say "-" x 65;

    # Sort alphabetically by name
    for my $s (sort { $a->{name} cmp $b->{name} } @$students) {
        my $avg   = calculate_average($s);    # compute this student's average
        my $grade = get_grade($avg);          # convert to letter grade
        printf "%-15s %-8s  %5s %5s %5s %5s | %6.1f %3s\n",
            $s->{name}, $s->{id}, @{$s->{scores}}, $avg, $grade;
        # @{$s->{scores}} unpacks the scores array ref into 4 separate values
    }

    say "=" x 65;

    # Class-wide statistics
    my @avgs = map { calculate_average($_) } @$students;   # compute average for every student
    printf "Class average: %.1f\n", sum(@avgs) / scalar(@avgs);
    printf "Highest avg  : %.1f\n", max(@avgs);
    printf "Lowest avg   : %.1f\n", min(@avgs);

    # Grade distribution - count how many students got each grade
    my %grade_dist;
    $grade_dist{get_grade($_)}++ for @avgs;   # for each average, count the grade
    say "\nGrade distribution:";
    say "  $_ : $grade_dist{$_}" for sort keys %grade_dist;
}

# ============================================================
# MAIN PROGRAM - execution starts here
# ============================================================

# Seed data: array of hash refs (each hash has name, id, and scores array ref)
my @students = (
    { name => "Alice Rahman",   id => "S001", scores => [92, 88, 95, 90] },
    { name => "Bob Tan",        id => "S002", scores => [75, 82, 78, 80] },
    { name => "Carol Singh",    id => "S003", scores => [60, 55, 65, 58] },
    { name => "David Lee",      id => "S004", scores => [98, 95, 97, 99] },
    { name => "Eve Ismail",     id => "S005", scores => [85, 89, 83, 87] },
    { name => "Frank Chong",    id => "S006", scores => [70, 72, 68, 74] },
    { name => "Grace Abdullah", id => "S007", scores => [45, 50, 42, 48] },
);

# Save to CSV then reload (demonstrates file I/O round-trip)
save_students($datafile, \@students);         # pass array ref to sub
say "Saved " . scalar(@students) . " students to $datafile";

my $loaded = load_students($datafile);        # returns array ref
say "Loaded " . scalar(@$loaded) . " students from $datafile\n";

print_report($loaded);   # display formatted grade table

# Find students who need academic support (average below 60)
say "\n=== Students Needing Support ===";
my @at_risk = grep { calculate_average($_) < 60 } @$loaded;   # filter array ref
if (@at_risk) {
    for my $s (@at_risk) {
        printf "  %s (%s) - Average: %.1f\n",
            $s->{name}, $s->{id}, calculate_average($s);
    }
} else {
    say "  All students are passing!";
}

say "\n=== Congratulations! You've completed all 100 Perl scripts! ===";
