#!/usr/bin/perl
# LESSON 2: Variables
# Perl has 3 types: scalars ($), arrays (@), hashes (%)

use strict;
use warnings;
use feature 'say';

# Scalar - holds a single value (number or string)
my $name    = "Alice";
my $age     = 25;
my $height  = 5.6;
my $is_cool = 1;   # 1 = true, 0 = false

say "Name   : $name";
say "Age    : $age";
say "Height : $height";
say "Cool?  : $is_cool";

# Perl figures out type from context
my $number  = 42;
my $string  = "The answer is $number";   # interpolation
say $string;

# You can reassign freely
$name = "Bob";
say "Name is now: $name";
