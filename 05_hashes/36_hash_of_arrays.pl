#!/usr/bin/perl
# LESSON 36: Hash of Arrays (HoA)
# A hash where each value is an ARRAY REFERENCE - lets you group lists under names

use strict;
use warnings;
use feature 'say';

# Each hash value is an array reference (created with [...])
my %courses = (
    Math    => ["Algebra", "Calculus", "Statistics"],    # array ref as value
    Science => ["Physics", "Chemistry", "Biology"],
    Lang    => ["English", "Malay", "Mandarin"],
);

# Access a single element: $hash{key}[index]
say "First Math course : $courses{Math}[0]";      # Algebra
say "Second Science    : $courses{Science}[1]";   # Chemistry
say "Last Lang         : $courses{Lang}[-1]";     # Mandarin (-1 = last)

# Iterate: loop keys, then dereference each array with @{ }
say "\nAll Courses:";
foreach my $dept (sort keys %courses) {
    my @subjects = @{ $courses{$dept} };   # @{ arrayref } dereferences the array ref
    say "  $dept:";
    say "    - $_" for @subjects;           # postfix for loops over the array
}

# Add to an existing array ref value using push
push @{ $courses{Math} }, "Trigonometry";           # @{ } dereferences before push
say "\nMath courses: " . join(", ", @{ $courses{Math} });   # now has 4 subjects

# Add a completely new key with an array ref value
$courses{Arts} = ["Drawing", "Music"];              # create key with two subjects
push @{ $courses{Arts} }, "Drama";                  # add a third subject

# Count items per group
say "\nCount per department:";
foreach my $dept (sort keys %courses) {
    say "  $dept: " . scalar(@{ $courses{$dept} }) . " courses";
    # scalar() on dereferenced array = count of elements
}
