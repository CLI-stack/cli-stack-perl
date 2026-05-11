#!/usr/bin/perl
# LESSON 50: Default Arguments and Named Parameters

use strict;
use warnings;
use feature 'say';

# Default values using //= or //
sub connect_db {
    my (%args) = @_;
    my $host    = $args{host}    // "localhost";
    my $port    = $args{port}    // 3306;
    my $timeout = $args{timeout} // 30;

    say "Connecting to $host:$port (timeout: ${timeout}s)";
}

connect_db(host => "db.prod.com", port => 5432);
connect_db(host => "db.local");
connect_db();   # all defaults

# Positional defaults using shift
sub greet {
    my $name    = shift // "World";
    my $greeting = shift // "Hello";
    say "$greeting, $name!";
}

greet("Alice", "Hi");
greet("Bob");
greet();

# Default list argument
sub print_items {
    my @items = @_ ? @_ : ("no", "items", "given");
    say join(", ", @items);
}

print_items("a", "b", "c");
print_items();

# Validate required args
sub create_user {
    my (%args) = @_;
    die "name is required!\n" unless exists $args{name};
    die "email is required!\n" unless exists $args{email};

    my $role = $args{role} // "user";
    say "Created: $args{name} <$args{email}> [$role]";
}

create_user(name => "Alice", email => "alice\@example.com");
create_user(name => "Bob",   email => "bob\@example.com", role => "admin");
