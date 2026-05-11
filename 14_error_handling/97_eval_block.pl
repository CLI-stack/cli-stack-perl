#!/usr/bin/perl
# LESSON 97: eval Block - Catching Errors (try/catch in Perl)

use strict;
use warnings;
use feature 'say';

# eval {} catches die() - like try/catch in other languages
# $@ holds the error message after eval

# Basic try/catch pattern
say "=== Basic eval ===";
eval {
    die "Something went wrong!\n";
};
if ($@) {
    say "Caught: $@";
} else {
    say "No error";
}

# eval returns the last expression if no error
my $val = eval { 2 + 2 };
say "val = " . (defined $val ? $val : "undef");
say "err = " . (defined $@ && $@ ne "" ? $@ : "none");

# Nested evals
say "\n=== Nested eval ===";
eval {
    eval {
        die "inner error\n";
    };
    say "Inner error caught: $@";
    # Outer eval doesn't see inner's $@
    die "outer error\n";
};
say "Outer error caught: $@";

# IMPORTANT: Always localize $@ to avoid clobbering
sub safe_call {
    my $func = shift;
    local $@;           # localize $@ to this sub
    my $result = eval { $func->() };
    if (my $err = $@) {
        warn "safe_call: $err";
        return undef;
    }
    return $result;
}

my $r1 = safe_call(sub { 42 });
my $r2 = safe_call(sub { die "oops\n" });
say "r1 = " . (defined $r1 ? $r1 : "undef");
say "r2 = " . (defined $r2 ? $r2 : "undef");

# Retry pattern
say "\n=== Retry pattern ===";
my $attempts = 0;
my $success  = 0;
until ($success || $attempts >= 3) {
    $attempts++;
    eval {
        die "transient error\n" if $attempts < 3;   # fail first 2 times
        $success = 1;
    };
    if ($@) { say "Attempt $attempts failed: $@" }
}
say $success ? "Succeeded on attempt $attempts" : "All attempts failed";
