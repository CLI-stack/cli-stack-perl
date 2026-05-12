#!/usr/bin/perl
# LESSON 79: Scalar::Util Module
# Provides utility functions for inspecting scalar values and references

use strict;
use warnings;
use feature 'say';
use Scalar::Util qw(looks_like_number blessed reftype weaken isweak);

# looks_like_number() - check if Perl would treat a value as numeric
# Useful for validating user input before doing math
my @tests = ("42", "3.14", "1e5", "0xFF", "hello", "12abc", " 5 ", undef);
say "=== looks_like_number ===";
for my $t (@tests) {
    my $display = defined $t ? "'$t'" : "undef";   # show undef explicitly
    printf "  %-10s => %s\n", $display,
        looks_like_number($t) ? "numeric" : "not numeric";
}

# blessed() - check if a reference is a blessed object (an instance of a class)
say "\n=== blessed ===";
my $plain_ref = { name => "Alice" };   # plain anonymous hash ref - NOT an object
say "Plain hashref blessed? " . (defined blessed($plain_ref) ? blessed($plain_ref) : "no");

# Create a simple class to test blessed()
package Person;
sub new { bless { name => $_[1] }, $_[0] }   # bless turns a ref into an object
package main;

my $obj = Person->new("Bob");                  # create an object of class Person
say "Person object blessed? " . (blessed($obj) // "no");   # prints: Person (the class name)

# reftype() - what is the UNDERLYING type of a reference?
# Unlike ref(), it sees through bless and gives the actual structure type
say "\n=== reftype ===";
say "hashref type  : " . (reftype($plain_ref) // "not a ref");   # HASH
say "arrayref type : " . (reftype([1,2,3])    // "not a ref");   # ARRAY
say "coderef type  : " . (reftype(sub{})      // "not a ref");   # CODE
say "object reftype: " . (reftype($obj)       // "not a ref");   # HASH (underlying structure)
say "plain scalar  : " . (reftype("hello")    // "not a ref");   # (empty - not a ref)

# Safe number parsing using looks_like_number
sub safe_num {
    my $val = shift;
    return undef unless looks_like_number($val);   # return undef if not a number
    return $val + 0;                                # convert to actual number
}
say "\n=== safe_num ===";
say defined safe_num("42")    ? "'42'    -> " . safe_num("42")    : "'42'    -> undef";
say defined safe_num("hello") ? "'hello' -> " . safe_num("hello") : "'hello' -> undef";
