#!/usr/bin/perl
# LESSON 48: Subroutine Arguments

use strict;
use warnings;
use feature 'say';

# @_ holds ALL arguments passed to a sub
sub show_args {
    say "Number of args: " . scalar(@_);
    for my $i (0..$#_) {
        say "  arg[$i] = $_[$i]";
    }
}

show_args("hello", 42, 3.14);

# Unpack @_ into named variables (best practice)
sub full_name {
    my ($first, $last) = @_;
    return "$first $last";
}
say full_name("John", "Doe");

# Variable number of arguments
sub sum_all {
    my $total = 0;
    $total += $_ for @_;
    return $total;
}
say "Sum: " . sum_all(1, 2, 3, 4, 5, 6);

# Mix fixed + variable args
sub log_message {
    my $level = shift;   # first arg
    my $msg   = join(" ", @_);   # rest of args joined
    say "[$level] $msg";
}
log_message("INFO", "Server", "started", "on port 8080");
log_message("ERROR", "Connection failed");

# Pass array (flattened into @_)
sub sum_array {
    return sum_all(@_);   # works because arrays flatten
}
my @data = (10, 20, 30);
say "Array sum: " . sum_array(@data);
