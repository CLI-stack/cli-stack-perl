#!/usr/bin/perl
# LESSON 74: Nested Data Structures

use strict;
use warnings;
use feature 'say';
use Data::Dumper;

# Complex nested structure: array of hash refs
my @company = (
    {
        name => "Engineering",
        head => "Alice",
        members => ["Bob", "Carol", "Dave"],
        budget => 500_000,
    },
    {
        name => "Marketing",
        head => "Eve",
        members => ["Frank", "Grace"],
        budget => 200_000,
    },
);

# Access nested data
say "Dept 1 head: $company[0]{head}";
say "Dept 2 name: $company[1]{name}";
say "Dept 1 members: " . join(", ", @{$company[0]{members}});
say "Dept 1 member 2: $company[0]{members}[1]";

# Iterate
say "\n--- Departments ---";
for my $dept (@company) {
    say "Department: $dept->{name}";
    say "  Head    : $dept->{head}";
    say "  Budget  : \$$dept->{budget}";
    say "  Members : " . join(", ", @{$dept->{members}});
    say "  Headcount: " . scalar(@{$dept->{members}});
}

# Hash of arrays
my %schedule = (
    Monday    => ["Standup", "Sprint Planning"],
    Tuesday   => ["Code Review"],
    Wednesday => ["Standup", "Demo"],
    Thursday  => ["1on1 meetings"],
    Friday    => ["Retrospective", "Standup"],
);

say "\n--- Weekly Schedule ---";
for my $day (qw(Monday Tuesday Wednesday Thursday Friday)) {
    say "$day:";
    say "  - $_" for @{$schedule{$day}};
}

# Data::Dumper for debugging complex structures
# say Dumper(\@company);   # uncomment to see structure
