#!/usr/bin/perl
# LESSON 73: Hash References
# Like array refs, hash refs let hashes be stored inside other structures

use strict;
use warnings;
use feature 'say';

my %person = (name => "Alice", age => 30, city => "KL");  # regular named hash

# Create a reference to the hash with backslash
my $href = \%person;

say "Type: " . ref($href);   # prints: HASH

# Dereference with %{$href} to get the whole hash
my %copy = %{$href};          # makes a COPY of the hash

# Access individual values using arrow notation: $href->{key}
say "Name: " . $href->{name};   # Alice - most common access method
say "Age : " . $href->{age};    # 30

# ANONYMOUS hash reference - created with {...} - most common in real code
my $config = {
    host => "localhost",   # {...} creates a hash ref directly (no named %hash needed)
    port => 3306,
    db   => "myapp",
};

say "\nHost: $config->{host}";   # access values with ->{ }
say "Port: $config->{port}";

# Add a new key through the reference
$href->{email} = "alice\@example.com";    # creates new key in %person
say "\nAdded email: $person{email}";       # %person now has email key

$config->{port} = 5432;   # modify a value through the reference

# Iterate over a hash ref using %{ } to dereference
say "\nConfig:";
for my $key (sort keys %{$config}) {       # keys %{ $href } = all keys
    say "  $key = $config->{$key}";        # access each value with ->{ }
}

# ARRAY OF HASH REFS - the most common complex data structure in Perl
my @users = (
    { name => "Alice", role => "admin"  },   # each element is an anonymous hash ref
    { name => "Bob",   role => "user"   },
    { name => "Carol", role => "editor" },
);

say "\nUsers:";
for my $user (@users) {                         # $user is each hash ref
    printf "  %-8s [%s]\n", $user->{name}, $user->{role};   # access fields with ->{ }
}

# Sort the array of hash refs by the "name" field
my @sorted = sort { $a->{name} cmp $b->{name} } @users;   # $a and $b are hash refs
say "\nSorted: " . join(", ", map { $_->{name} } @sorted);   # map extracts names
