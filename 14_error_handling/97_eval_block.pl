#!/usr/bin/perl
# LESSON 97: eval Block - Catching Errors (Perl's try/catch)
# eval {} runs code and catches any die() calls instead of crashing

use strict;
use warnings;
use feature 'say';

# eval { code } is Perl's equivalent of try { } catch { }
# If die() is called inside eval, execution jumps to after the eval block
# $@ holds the error message (empty string "" if no error occurred)

say "=== Basic eval ===";
eval {
    die "Something went wrong!\n";   # die inside eval is caught
};
if ($@) {
    say "Caught error: $@";   # prints the die message
} else {
    say "No error occurred";
}

# eval returns the LAST expression value if no error
my $val = eval { 2 + 2 };   # no die, returns 4
say "val = " . (defined $val ? $val : "undef");   # 4
say "err = " . ($@ ? $@ : "none");                # no error

# Nested evals: inner and outer are independent
say "\n=== Nested eval ===";
eval {
    eval {
        die "inner error\n";   # caught by inner eval
    };
    say "Inner error was: $@";   # can inspect inner error
    die "outer error\n";         # this die is caught by outer eval
};
say "Outer error was: $@";

# CRITICAL: Always localize $@ to prevent subtle bugs
# If a DESTROY method or other code runs between eval and $@ check,
# $@ can be overwritten. Use 'local $@' to protect it.
sub safe_call {
    my $func = shift;
    local $@;                           # isolate $@ to this sub scope
    my $result = eval { $func->() };   # run the function safely
    if (my $err = $@) {                # capture error before anything else runs
        warn "safe_call: $err";
        return undef;
    }
    return $result;
}

my $r1 = safe_call(sub { 42 });          # no error -> returns 42
my $r2 = safe_call(sub { die "oops\n" });  # error -> returns undef
say "r1 = " . (defined $r1 ? $r1 : "undef");
say "r2 = " . (defined $r2 ? $r2 : "undef");

# Retry pattern: attempt up to N times, catching failures each time
say "\n=== Retry pattern ===";
my $attempts = 0;
my $success  = 0;
until ($success || $attempts >= 3) {
    $attempts++;
    eval {
        die "transient error\n" if $attempts < 3;   # simulate failure on attempts 1 and 2
        $success = 1;                                # no die = success
    };
    say "Attempt $attempts " . ($@ ? "failed: " . $@ : "succeeded");
}
