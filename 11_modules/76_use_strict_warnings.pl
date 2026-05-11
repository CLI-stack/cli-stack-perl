#!/usr/bin/perl
# LESSON 76: use strict and use warnings - Why They Matter

use strict;
use warnings;
use feature 'say';

# 'use strict' enforces:
#   1. All variables must be declared with 'my', 'our', or 'local'
#   2. Barewords are not allowed (unless they are subs or strings)
#   3. Symbolic references (using strings as variable names) are disabled

# CORRECT with strict:
my $name = "Alice";
my @list = (1, 2, 3);
my %hash = (a => 1);

say "strict is active - these work fine";

# Without strict this would silently create a new global:
# $undeclared = "oops";  # ERROR with strict

# 'use warnings' catches common mistakes:
my $uninitialized;
# This would warn: "Use of uninitialized value"
# say $uninitialized . " world";

# Numeric used as string warn
my $num_str = "42abc";
my $n = $num_str + 0;   # warns: "Argument isn't numeric"
say "Numeric: $n";

# Common beginner mistake caught by warnings:
my $x = "5";
my $y = "10";
say "String concat : " . ($x . $y);   # "510"
say "Numeric add   : " . ($x + $y);   # 15

# 'use feature' adds modern Perl features
# 'say' is a feature (print with newline)
# 'state' is a feature (persistent lexical variable)
use feature 'state';

sub counter {
    state $count = 0;   # persists between calls!
    return ++$count;
}

say "\nCounter: " . counter() for 1..5;

# Together, use these three lines in EVERY Perl script:
# use strict;
# use warnings;
# use feature 'say';
