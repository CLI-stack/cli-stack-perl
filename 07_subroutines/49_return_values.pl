#!/usr/bin/perl
# LESSON 49: Return Values - Scalar and List

use strict;
use warnings;
use feature 'say';

# Return a single scalar
sub get_pi {
    return 3.14159;
}
my $pi = get_pi();
say "Pi: $pi";

# Return a list
sub get_min_max {
    my @nums = @_;
    my @sorted = sort { $a <=> $b } @nums;
    return ($sorted[0], $sorted[-1]);   # list return
}

my ($min, $max) = get_min_max(5, 3, 9, 1, 7);
say "Min: $min, Max: $max";

# Return based on context (wantarray)
sub flexible {
    if (wantarray) {
        return (1, 2, 3);       # list context
    } else {
        return "one value";     # scalar context
    }
}

my @list_result   = flexible();
my $scalar_result = flexible();
say "List  : " . join(", ", @list_result);
say "Scalar: $scalar_result";

# Return a hash
sub get_config {
    return (
        host => "localhost",
        port => 8080,
        debug => 1,
    );
}
my %cfg = get_config();
say "Host: $cfg{host}, Port: $cfg{port}";

# Early return
sub divide {
    my ($a, $b) = @_;
    return undef if $b == 0;   # early return for error
    return $a / $b;
}
say divide(10, 2)  // "error";
say divide(10, 0)  // "division by zero!";
