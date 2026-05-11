#!/usr/bin/perl
# LESSON 86: Environment Variables

use strict;
use warnings;
use feature 'say';

# %ENV is a special hash containing all environment variables
say "=== Common ENV vars ===";
say "HOME  : " . ($ENV{HOME}  // "not set");
say "PATH  : " . ($ENV{PATH}  // "not set");
say "USER  : " . ($ENV{USER}  // "not set");
say "SHELL : " . ($ENV{SHELL} // "not set");
say "PWD   : " . ($ENV{PWD}   // "not set");

# Set an environment variable (affects child processes)
$ENV{MY_APP_ENV} = "production";
say "\nSet MY_APP_ENV: $ENV{MY_APP_ENV}";

# Check if a variable is set
if (exists $ENV{MY_APP_ENV}) {
    say "MY_APP_ENV is set to: $ENV{MY_APP_ENV}";
}

# Delete an environment variable
delete $ENV{MY_APP_ENV};
say "After delete: " . (exists $ENV{MY_APP_ENV} ? $ENV{MY_APP_ENV} : "not set");

# Use env vars for configuration (12-factor app pattern)
my $config = {
    host    => $ENV{DB_HOST}  // "localhost",
    port    => $ENV{DB_PORT}  // 5432,
    db      => $ENV{DB_NAME}  // "myapp",
    user    => $ENV{DB_USER}  // "postgres",
    debug   => $ENV{DEBUG}    // 0,
};

say "\n=== App Configuration (from ENV with defaults) ===";
say "  $_ = $config->{$_}" for sort keys %$config;

# List all env vars (sorted)
say "\n=== All ENV variables (first 10) ===";
my $count = 0;
for my $key (sort keys %ENV) {
    printf "  %-20s = %s\n", $key, $ENV{$key};
    last if ++$count >= 10;
}
