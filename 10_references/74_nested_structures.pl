#!/usr/bin/perl
# LESSON 74: Nested Data Structures
# Combining arrays, hashes, and references to model complex real-world data

use strict;
use warnings;
use feature 'say';
use Data::Dumper;   # useful for printing complex structures during debugging

# An array of hash refs, where some values are themselves array refs
my @company = (
    {
        name    => "Engineering",      # scalar value
        head    => "Alice",            # scalar value
        members => ["Bob", "Carol", "Dave"],  # array ref as a value
        budget  => 500_000,            # scalar value
    },
    {
        name    => "Marketing",
        head    => "Eve",
        members => ["Frank", "Grace"],
        budget  => 200_000,
    },
);

# Access nested values using chains of -> operators
say "Dept 1 head: $company[0]{head}";                  # Alice (array index, then hash key)
say "Dept 2 name: $company[1]{name}";                  # Marketing
say "Dept 1 members: " . join(", ", @{$company[0]{members}});  # deref the array ref
say "Dept 1 member 2: $company[0]{members}[1]";        # Carol (index into the array ref)

# Iterate the outer array, then access nested data
say "\n--- Departments ---";
for my $dept (@company) {                              # $dept = each hash ref
    say "Department: $dept->{name}";
    say "  Head    : $dept->{head}";
    say "  Budget  : \$$dept->{budget}";               # \$ prints a literal $ sign
    say "  Members : " . join(", ", @{$dept->{members}});  # deref members array
    say "  Headcount: " . scalar(@{$dept->{members}}); # count elements in array ref
}

# Hash of arrays - schedule by day
my %schedule = (
    Monday    => ["Standup", "Sprint Planning"],   # each value is an array ref
    Tuesday   => ["Code Review"],
    Wednesday => ["Standup", "Demo"],
    Thursday  => ["1on1 meetings"],
    Friday    => ["Retrospective", "Standup"],
);

say "\n--- Weekly Schedule ---";
for my $day (qw(Monday Tuesday Wednesday Thursday Friday)) {
    say "$day:";
    say "  - $_" for @{$schedule{$day}};   # deref each day's array ref
}

# Data::Dumper is your best tool for debugging complex structures
# Uncomment to see the full structure printed:
# say Dumper(\@company);
