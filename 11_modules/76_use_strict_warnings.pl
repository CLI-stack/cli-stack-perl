#!/usr/bin/perl
# LESSON 76: use strict and use warnings - Why They Matter
# These two lines catch bugs early and should be in EVERY Perl script

use strict;    # enforce safe coding rules
use warnings;  # warn about risky or potentially wrong code
use feature 'say';

# WHAT 'use strict' ENFORCES:
# 1. All variables must be declared with 'my', 'our', or 'local'
# 2. Barewords are forbidden (unless they are sub names or file handles)
# 3. Symbolic references (using a string as a variable name) are disabled

my $name  = "Alice";    # CORRECT: declared with 'my'
my @list  = (1, 2, 3); # CORRECT: array declared with 'my'
my %hash  = (a => 1);  # CORRECT: hash declared with 'my'

say "strict is active - these work fine";

# Without 'use strict', you could write: $undeclared = "oops"
# This would silently create a global - hard-to-find bugs!
# With strict: "Global symbol requires explicit package name" -> caught!

# WHAT 'use warnings' CATCHES:
# - Using an undefined variable (uninitialized value)
# - Using a string where a number is expected
# - Many other common mistakes

my $uninitialized;   # declared but no value = undef
# This line would warn: "Use of uninitialized value in concatenation"
# say $uninitialized . " world";

# 'use feature' adds modern Perl features not available in older versions
use feature 'state';   # 'state' declares a variable that persists between calls

sub counter {
    state $count = 0;    # 'state' variable: initialized ONCE, persists across calls
    return ++$count;     # increment and return
}

say "\nCounter persists across calls:";
say "Counter: " . counter() for 1..5;   # prints 1, 2, 3, 4, 5

# ALWAYS START EVERY SCRIPT WITH THESE THREE LINES:
# use strict;
# use warnings;
# use feature 'say';
say "\nThese three lines prevent most beginner bugs!";
