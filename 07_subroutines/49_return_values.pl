#!/usr/bin/perl
# LESSON 49: Return Values - Single Values, Lists, and Context-Sensitive Returns

use strict;
use warnings;
use feature 'say';

# Return a single scalar value
sub get_pi {
    return 3.14159;   # return sends one value back to caller
}
my $pi = get_pi();    # caller receives the value
say "Pi: $pi";

# Return MULTIPLE values as a LIST
sub get_min_max {
    my @nums   = @_;                             # receive all arguments
    my @sorted = sort { $a <=> $b } @nums;       # sort numerically
    return ($sorted[0], $sorted[-1]);            # return first and last as a list
}

my ($min, $max) = get_min_max(5, 3, 9, 1, 7);   # unpack the returned list
say "Min: $min, Max: $max";                       # prints: Min: 1, Max: 9

# wantarray - return different things depending on what the caller expects
sub flexible {
    if (wantarray) {                   # wantarray() returns true if caller wants a list
        return (1, 2, 3);             # list context: return multiple values
    } else {
        return "one value";           # scalar context: return a single value
    }
}

my @list_result   = flexible();   # list context   - gets (1, 2, 3)
my $scalar_result = flexible();   # scalar context - gets "one value"
say "List  : " . join(", ", @list_result);
say "Scalar: $scalar_result";

# Return a hash (as a flat list - caller rebuilds it)
sub get_config {
    return (
        host  => "localhost",    # returned as flat list: key, value, key, value...
        port  => 8080,
        debug => 1,
    );
}
my %cfg = get_config();          # caller reassembles into a hash
say "Host: $cfg{host}, Port: $cfg{port}";

# Early return for error handling
sub divide {
    my ($a, $b) = @_;
    return undef if $b == 0;   # return early with undef to signal error
    return $a / $b;            # normal return if no error
}
say divide(10, 2)  // "error";          # prints: 5
say divide(10, 0)  // "division by zero!";  # undef -> uses // default
