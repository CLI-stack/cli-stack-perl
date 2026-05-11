#!/usr/bin/perl
# LESSON 32: Hash Basics (Key-Value Pairs)
# Hashes are like dictionaries in Python or objects in JS

use strict;
use warnings;
use feature 'say';

# Create a hash with %
my %person = (
    name    => "Alice",
    age     => 30,
    city    => "New York",
    job     => "Engineer",
);

# Access value with $hash{key}
say "Name: $person{name}";
say "Age : $person{age}";

# Add or update a key
$person{email} = "alice\@example.com";
$person{age}   = 31;
say "Updated age  : $person{age}";
say "Added email  : $person{email}";

# Delete a key
delete $person{city};

# Check if key exists
if (exists $person{name}) {
    say "name key exists";
}
if (!exists $person{city}) {
    say "city was deleted";
}

# List all keys and values
say "\nAll keys  : " . join(", ", sort keys %person);
say "All values: " . join(", ", map { $person{$_} } sort keys %person);

# Hash in scalar context = fraction (used/available buckets)
my $info = %person;
say "Hash info: $info";
