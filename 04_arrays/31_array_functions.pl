#!/usr/bin/perl
# LESSON 31: Useful Array Functions

use strict;
use warnings;
use feature 'say';
use List::Util qw(sum min max first reduce any all none);

my @nums = (5, 3, 8, 1, 9, 2, 7, 4, 6);

say "Array  : " . join(", ", @nums);
say "Sum    : " . sum(@nums);
say "Min    : " . min(@nums);
say "Max    : " . max(@nums);

# first - return first element matching condition
my $first_big = first { $_ > 6 } @nums;
say "First > 6: $first_big";

# any / all / none
say "Any > 8 ? " . (any { $_ > 8 } @nums ? "yes" : "no");
say "All > 0 ? " . (all { $_ > 0 } @nums ? "yes" : "no");
say "None < 0? " . (none { $_ < 0 } @nums ? "yes" : "no");

# wantarray - know if caller expects list or scalar
sub flexible {
    return wantarray ? (1, 2, 3) : "one value";
}
my @list  = flexible();   # list context
my $scalar = flexible();  # scalar context
say "List  : " . join(", ", @list);
say "Scalar: $scalar";

# uniq (remove duplicates) - Perl 5.26+ via List::Util
use List::Util qw(uniq);
my @dupes = (1, 2, 2, 3, 3, 3, 4);
my @unique = uniq @dupes;
say "Unique: " . join(", ", @unique);

# reverse
my @rev = reverse @nums;
say "Reversed: " . join(", ", @rev);
