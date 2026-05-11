#!/usr/bin/perl
# LESSON 35: delete, exists, and defined in Hashes

use strict;
use warnings;
use feature 'say';

my %config = (
    host    => "localhost",
    port    => 8080,
    debug   => 0,
    timeout => undef,   # key exists but value is undef
);

# exists - checks if KEY is present (even if value is undef)
say "host exists?    " . (exists $config{host}    ? "yes" : "no");
say "password exists?" . (exists $config{password} ? "yes" : "no");
say "timeout exists? " . (exists $config{timeout}  ? "yes" : "no");

# defined - checks if VALUE is not undef
say "\nhost defined?    " . (defined $config{host}    ? "yes" : "no");
say "timeout defined? " . (defined $config{timeout}  ? "yes" : "no");

# delete - removes the key entirely
delete $config{debug};
say "\nAfter deleting 'debug':";
say "debug exists? " . (exists $config{debug} ? "yes" : "no");

# delete returns the removed value
my $old_port = delete $config{port};
say "Deleted port value: $old_port";

# delete a hash slice (multiple keys)
$config{a} = 1; $config{b} = 2; $config{c} = 3;
delete @config{qw(a b)};
say "After deleting a,b: keys = " . join(", ", sort keys %config);

# Safe access pattern (avoid autovivification)
my $val = exists $config{missing} ? $config{missing} : "default";
say "Missing key default: $val";
