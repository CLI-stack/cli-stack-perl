#!/usr/bin/perl
# LESSON 100: CAPSTONE - Mini Student Grade Manager
# This combines everything you've learned: variables, arrays, hashes,
# control flow, subroutines, file I/O, regex, references, and error handling.

use strict;
use warnings;
use feature 'say';
use List::Util qw(sum min max);
use POSIX qw(floor);

my $datafile = "/tmp/grades.csv";

# ============================================================
# SUBROUTINES
# ============================================================

sub load_students {
    my $file = shift;
    return [] unless -f $file;

    open(my $fh, '<', $file) or die "Cannot read $file: $!\n";
    my @students;
    my $header = <$fh>;   # skip header
    while (<$fh>) {
        chomp;
        next if /^\s*$/ || /^#/;
        my ($name, $id, @scores) = split /,/;
        push @students, {
            name   => $name,
            id     => $id,
            scores => \@scores,
        };
    }
    close $fh;
    return \@students;
}

sub save_students {
    my ($file, $students) = @_;
    open(my $fh, '>', $file) or die "Cannot write $file: $!\n";
    print $fh "Name,ID,Math,Science,English,History\n";
    for my $s (@$students) {
        print $fh join(",", $s->{name}, $s->{id}, @{$s->{scores}}) . "\n";
    }
    close $fh;
}

sub calculate_average {
    my @scores = @{ shift->{scores} };
    return @scores ? sum(@scores) / scalar(@scores) : 0;
}

sub get_grade {
    my $avg = shift;
    return "A+" if $avg >= 95;
    return "A"  if $avg >= 90;
    return "A-" if $avg >= 85;
    return "B+" if $avg >= 80;
    return "B"  if $avg >= 75;
    return "B-" if $avg >= 70;
    return "C"  if $avg >= 60;
    return "F";
}

sub print_report {
    my $students = shift;

    say "=" x 65;
    say " STUDENT GRADE REPORT";
    say "=" x 65;
    printf "%-15s %-8s  %5s %5s %5s %5s | %6s %3s\n",
        "Name", "ID", "Math", "Sci", "Eng", "His", "Avg", "Grd";
    say "-" x 65;

    for my $s (sort { $a->{name} cmp $b->{name} } @$students) {
        my $avg   = calculate_average($s);
        my $grade = get_grade($avg);
        printf "%-15s %-8s  %5s %5s %5s %5s | %6.1f %3s\n",
            $s->{name}, $s->{id}, @{$s->{scores}}, $avg, $grade;
    }

    say "=" x 65;

    # Class statistics
    my @avgs = map { calculate_average($_) } @$students;
    printf "Class average: %.1f\n", sum(@avgs) / scalar(@avgs);
    printf "Highest     : %.1f\n", max(@avgs);
    printf "Lowest      : %.1f\n", min(@avgs);

    my %grade_dist;
    $grade_dist{get_grade($_)}++ for @avgs;
    say "\nGrade distribution:";
    say "  $_ : $grade_dist{$_}" for sort keys %grade_dist;
}

# ============================================================
# MAIN PROGRAM
# ============================================================

# Seed data
my @students = (
    { name => "Alice Rahman",    id => "S001", scores => [92, 88, 95, 90] },
    { name => "Bob Tan",         id => "S002", scores => [75, 82, 78, 80] },
    { name => "Carol Singh",     id => "S003", scores => [60, 55, 65, 58] },
    { name => "David Lee",       id => "S004", scores => [98, 95, 97, 99] },
    { name => "Eve Ismail",      id => "S005", scores => [85, 89, 83, 87] },
    { name => "Frank Chong",     id => "S006", scores => [70, 72, 68, 74] },
    { name => "Grace Abdullah",  id => "S007", scores => [45, 50, 42, 48] },
);

# Save and reload (demonstrates file I/O)
save_students($datafile, \@students);
say "Saved " . scalar(@students) . " students to $datafile";

my $loaded = load_students($datafile);
say "Loaded " . scalar(@$loaded) . " students from $datafile\n";

# Print report
print_report($loaded);

# Find students who need help (below 60)
say "\n=== Students Needing Support ===";
my @at_risk = grep { calculate_average($_) < 60 } @$loaded;
if (@at_risk) {
    for my $s (@at_risk) {
        printf "  %s (%s) - Average: %.1f\n",
            $s->{name}, $s->{id}, calculate_average($s);
    }
} else {
    say "  All students are passing!";
}

say "\n=== Congratulations! You've completed all 100 Perl lessons! ===";
