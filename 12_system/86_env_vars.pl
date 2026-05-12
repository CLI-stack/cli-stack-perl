#!/usr/bin/perl
# LESSON 86: Environment Variables
# %ENV is a special Perl hash that holds all shell environment variables

use strict;
use warnings;
use feature 'say';

# %ENV is pre-populated with all environment variables when your script starts
say "=== Common ENV variables ===";
say "HOME  : " . ($ENV{HOME}  // "not set");   # home directory
say "PATH  : " . ($ENV{PATH}  // "not set");   # command search path
say "USER  : " . ($ENV{USER}  // "not set");   # current username
say "SHELL : " . ($ENV{SHELL} // "not set");   # default shell program
say "PWD   : " . ($ENV{PWD}   // "not set");   # current working directory

# Set an environment variable (also affects child processes you start)
$ENV{MY_APP_ENV} = "production";   # create new entry in %ENV
say "\nSet MY_APP_ENV: $ENV{MY_APP_ENV}";

# Check if a variable exists (use exists, not just truthiness - value might be "0")
if (exists $ENV{MY_APP_ENV}) {
    say "MY_APP_ENV is set to: $ENV{MY_APP_ENV}";
}

# Delete an environment variable (removes it for child processes too)
delete $ENV{MY_APP_ENV};
say "After delete: " . (exists $ENV{MY_APP_ENV} ? $ENV{MY_APP_ENV} : "not set");

# 12-Factor App pattern: read all config from environment variables with defaults
# This is best practice for configurable applications
my $config = {
    host  => $ENV{DB_HOST}  // "localhost",   # use env var or fallback to default
    port  => $ENV{DB_PORT}  // 5432,
    db    => $ENV{DB_NAME}  // "myapp",
    user  => $ENV{DB_USER}  // "postgres",
    debug => $ENV{DEBUG}    // 0,
};

say "\n=== App Config (from ENV with defaults) ===";
say "  $_ = $config->{$_}" for sort keys %$config;

# List all environment variables (first 10 for brevity)
say "\n=== All ENV variables (first 10) ===";
my $count = 0;
for my $key (sort keys %ENV) {               # sort gives consistent output
    printf "  %-20s = %s\n", $key, $ENV{$key};
    last if ++$count >= 10;                   # stop after 10 to keep output manageable
}
