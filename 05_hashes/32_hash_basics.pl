#!/usr/bin/perl
# LESSON 32: Hash Basics (Key-Value Pairs)
# A hash is like a dictionary: every entry has a name (key) and a value

use strict;
use warnings;
use feature 'say';

# Hashes use % sigil; entries are key => value pairs
my %person = (
    name => "Alice",       # key "name" maps to value "Alice"
    age  => 30,            # key "age" maps to value 30
    city => "New York",    # key "city" maps to value "New York"
    job  => "Engineer",    # key "job" maps to value "Engineer"
);

# Access a single value using $hash{key} notation
say "Name: $person{name}";   # $ because we get ONE scalar value
say "Age : $person{age}";

# Add a new key or update an existing key
$person{email} = "alice\@example.com";  # new key "email" created automatically
$person{age}   = 31;                    # existing key "age" updated

say "Updated age  : $person{age}";    # prints: 31
say "Added email  : $person{email}";  # prints: alice@example.com

delete $person{city};   # delete() removes a key-value pair completely from the hash

if (exists $person{name}) {    # exists() checks if the KEY is present (regardless of value)
    say "name key exists";
}
if (!exists $person{city}) {   # city was deleted, so exists returns false
    say "city was deleted";
}

say "\nAll keys  : " . join(", ", sort keys %person);   # keys() returns all keys as a list
say "All values: " . join(", ", map { $person{$_} } sort keys %person);  # get value for each key

# Hash in scalar context gives a fraction like "3/8" (used/total buckets - rarely needed)
my $info = %person;
say "Hash info: $info";
