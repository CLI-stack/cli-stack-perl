#!/usr/bin/perl
# LESSON 73: Hash References

use strict;
use warnings;
use feature 'say';

my %person = (name => "Alice", age => 30, city => "KL");

# Create reference to hash
my $href = \%person;

say "Type: " . ref($href);   # HASH

# Dereference: %{$href} or %$href
my %copy = %{$href};

# Access key: $href->{key} or $$href{key}
say "Name: " . $href->{name};
say "Age : " . $href->{age};

# Anonymous hash reference - very common in Perl!
my $config = {
    host    => "localhost",
    port    => 3306,
    db      => "myapp",
};

say "\nHost: $config->{host}";
say "Port: $config->{port}";

# Modify via reference
$href->{email} = "alice\@example.com";
say "\nAdded email: $person{email}";

$config->{port} = 5432;

# Iterate over hash ref
say "\nConfig:";
for my $key (sort keys %{$config}) {
    say "  $key = $config->{$key}";
}

# Array of hash refs (very common pattern)
my @users = (
    { name => "Alice", role => "admin"  },
    { name => "Bob",   role => "user"   },
    { name => "Carol", role => "editor" },
);

say "\nUsers:";
for my $user (@users) {
    printf "  %-8s [%s]\n", $user->{name}, $user->{role};
}

# Sort array of hash refs by a field
my @sorted = sort { $a->{name} cmp $b->{name} } @users;
say "\nSorted: " . join(", ", map { $_->{name} } @sorted);
