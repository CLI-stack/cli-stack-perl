#!/usr/bin/perl
# LESSON 50: Default Arguments and Named Parameters
# How to give arguments sensible defaults and use hash-style named params

use strict;
use warnings;
use feature 'say';

# Named parameters using a hash - caller passes key => value pairs
# // is the "defined-or" operator: use left if defined, otherwise use right (default)
sub connect_db {
    my (%args)  = @_;                       # flatten all key=>value args into a hash
    my $host    = $args{host}    // "localhost";  # default to localhost if not given
    my $port    = $args{port}    // 3306;         # default port for MySQL
    my $timeout = $args{timeout} // 30;           # default 30 second timeout

    say "Connecting to $host:$port (timeout: ${timeout}s)";
}

connect_db(host => "db.prod.com", port => 5432);   # override host and port
connect_db(host => "db.local");                     # override host only; port uses default
connect_db();                                        # all defaults: localhost:3306

# Positional defaults using shift and //
sub greet {
    my $name     = shift // "World";    # first argument or default "World"
    my $greeting = shift // "Hello";   # second argument or default "Hello"
    say "$greeting, $name!";
}

greet("Alice", "Hi");   # uses both args
greet("Bob");           # uses default greeting "Hello"
greet();                # uses both defaults: "Hello, World!"

# Default to a list if no arguments provided
sub print_items {
    my @items = @_ ? @_ : ("no", "items", "given");  # if @_ is not empty use it, else default
    say join(", ", @items);
}

print_items("a", "b", "c");   # uses provided args
print_items();                 # uses default list

# Require specific args and die clearly if missing
sub create_user {
    my (%args) = @_;
    die "name is required!\n"  unless exists $args{name};   # die stops the program with message
    die "email is required!\n" unless exists $args{email};

    my $role = $args{role} // "user";   # role is optional; default to "user"
    say "Created: $args{name} <$args{email}> [$role]";
}

create_user(name => "Alice", email => "alice\@example.com");
create_user(name => "Bob",   email => "bob\@example.com", role => "admin");
