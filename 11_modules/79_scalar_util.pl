#!/usr/bin/perl
# LESSON 79: Scalar::Util Module

use strict;
use warnings;
use feature 'say';
use Scalar::Util qw(
    looks_like_number
    blessed reftype
    weaken isweak
    readonly
    tainted
);

# looks_like_number - check if a scalar acts numeric
my @tests = ("42", "3.14", "1e5", "0xFF", "hello", "12abc", " 5 ", undef);
say "=== looks_like_number ===";
for my $t (@tests) {
    my $display = defined $t ? "'$t'" : "undef";
    printf "  %-10s => %s\n", $display,
        looks_like_number($t) ? "numeric" : "not numeric";
}

# blessed - is it a blessed reference (object)?
say "\n=== blessed ===";
my $plain_ref = { name => "Alice" };
say "Plain hashref blessed? " . (defined blessed($plain_ref) ? blessed($plain_ref) : "no");

package Person;
sub new { bless { name => $_[1] }, $_[0] }
package main;

my $obj = Person->new("Bob");
say "Person object blessed? " . (blessed($obj) // "no");
say "Class name: " . (blessed($obj) // "none");

# reftype - what is the underlying type?
say "\n=== reftype ===";
say "hashref type : " . (reftype($plain_ref)    // "not a ref");
say "arrayref type: " . (reftype([1,2,3])        // "not a ref");
say "coderef type : " . (reftype(sub{})          // "not a ref");
say "scalar       : " . (reftype("hello")        // "not a ref");

# Safe number parsing
sub safe_num {
    my $val = shift;
    return undef unless looks_like_number($val);
    return $val + 0;
}
say "\n=== safe_num ===";
say defined safe_num("42")    ? "42    -> " . safe_num("42")    : "undef";
say defined safe_num("hello") ? "hello -> " . safe_num("hello") : "hello -> undef";
