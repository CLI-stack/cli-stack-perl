#!/usr/bin/perl
# LESSON 35: delete, exists, and defined in Hashes
# Three different ways to check or remove hash entries

use strict;
use warnings;
use feature 'say';

my %config = (
    host    => "localhost",   # key exists, value is a string
    port    => 8080,          # key exists, value is a number
    debug   => 0,             # key exists, value is 0 (falsy but defined)
    timeout => undef,         # key EXISTS but value is undef (no value assigned)
);

# exists() checks if the KEY is in the hash - doesn't care about value
say "host exists?    " . (exists $config{host}     ? "yes" : "no");  # yes
say "password exists?" . (exists $config{password} ? "yes" : "no");  # no - never added
say "timeout exists? " . (exists $config{timeout}  ? "yes" : "no");  # yes - key is there

# defined() checks if the VALUE is not undef
say "\nhost defined?    " . (defined $config{host}    ? "yes" : "no");  # yes - has a string
say "timeout defined? " . (defined $config{timeout}  ? "yes" : "no");  # no  - value is undef
say "debug defined?   " . (defined $config{debug}    ? "yes" : "no");  # yes - 0 IS defined

# delete() removes the key AND its value from the hash
delete $config{debug};                              # removes "debug" key entirely
say "\nAfter deleting 'debug':";
say "debug exists? " . (exists $config{debug} ? "yes" : "no");  # no

my $old_port = delete $config{port};                # delete also RETURNS the removed value
say "Deleted port value: $old_port";                # prints: 8080

# Delete a hash SLICE (multiple keys at once)
$config{a} = 1; $config{b} = 2; $config{c} = 3;   # add temporary keys
delete @config{qw(a b)};                            # @config{list} = hash slice
say "After deleting a,b: keys = " . join(", ", sort keys %config);

# Safe access pattern to avoid autovivification (accidentally creating keys)
my $val = exists $config{missing} ? $config{missing} : "default";
say "Missing key default: $val";   # prints: default (key was NOT created)
