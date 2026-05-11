#!/usr/bin/perl
# LESSON 36: Hash of Arrays (HoA) - Complex Data Structures

use strict;
use warnings;
use feature 'say';

# Hash where each value is an array (reference)
my %courses = (
    Math    => ["Algebra", "Calculus", "Statistics"],
    Science => ["Physics", "Chemistry", "Biology"],
    Lang    => ["English", "Malay", "Mandarin"],
);

# Access: $hash{key}[index]
say "First Math course : $courses{Math}[0]";
say "Second Science    : $courses{Science}[1]";
say "Last Lang         : $courses{Lang}[-1]";

# Iterate over HoA
say "\nAll Courses:";
foreach my $dept (sort keys %courses) {
    my @subjects = @{ $courses{$dept} };   # dereference
    say "  $dept:";
    say "    - $_" for @subjects;
}

# Add to an existing key's array
push @{ $courses{Math} }, "Trigonometry";
say "\nMath courses: " . join(", ", @{ $courses{Math} });

# Add a new subject group
$courses{Arts} = ["Drawing", "Music"];
push @{ $courses{Arts} }, "Drama";

# Count items per group
say "\nCount per department:";
foreach my $dept (sort keys %courses) {
    say "  $dept: " . scalar(@{ $courses{$dept} }) . " courses";
}
