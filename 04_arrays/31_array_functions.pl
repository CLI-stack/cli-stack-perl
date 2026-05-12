#!/usr/bin/perl
# LESSON 31: Useful Array Functions from List::Util
# List::Util provides powerful functions for working with lists

use strict;
use warnings;
use feature 'say';
use List::Util qw(sum sum0 product min max first reduce any all none uniq);

my @nums  = (5, 3, 8, 1, 9, 2, 7, 4, 6);   # test array of numbers
my @words = qw(banana apple cherry apple banana date banana);  # with duplicates

say "=== Numeric Functions ===";
say "sum    : " . sum(@nums);       # sum() adds all elements -> 45
say "sum0   : " . sum0();           # sum0() returns 0 for empty list (sum returns undef)
say "product: " . product(@nums);   # product() multiplies all elements together
say "min    : " . min(@nums);       # min() finds the smallest -> 1
say "max    : " . max(@nums);       # max() finds the largest  -> 9

say "\n=== Search Functions ===";
my $big = first { $_ > 6 } @nums;           # first() returns the FIRST element matching condition
say "first > 6   : $big";                    # prints: 8 (first number above 6)

say "any > 8 ? " . (any  { $_ > 8 } @nums ? "yes" : "no");  # any() = true if ANY element matches
say "all > 0 ? " . (all  { $_ > 0 } @nums ? "yes" : "no");  # all() = true if ALL elements match
say "none < 0? " . (none { $_ < 0 } @nums ? "yes" : "no");  # none() = true if NO element matches

say "\n=== reduce ===";
my $factorial = reduce { $a * $b } 1..6;   # reduce accumulates: 1*2=2, 2*3=6, 6*4=24...
say "6! = $factorial";                       # 6 factorial = 720

say "\n=== Unique ===";
my @unique = uniq @words;                   # uniq() removes duplicate values (keeps first occurrence)
say "Unique: " . join(", ", @unique);       # banana, apple, cherry, date

say "\n=== reverse ===";
my @rev = reverse @nums;                    # reverse() reverses the ORDER of array elements
say "Reversed: " . join(", ", @rev);        # 6, 4, 7, 2, 9, 1, 8, 3, 5

# wantarray: know if caller wants a list or scalar return
sub flexible {
    return wantarray ? (1, 2, 3) : "one value";  # return different things based on context
}
my @list   = flexible();   # list context   -> (1, 2, 3)
my $scalar = flexible();   # scalar context -> "one value"
say "\nList  : " . join(", ", @list);
say "Scalar: $scalar";
