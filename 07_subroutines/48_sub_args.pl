#!/usr/bin/perl
# LESSON 48: Subroutine Arguments
# How Perl passes data into subroutines via @_

use strict;
use warnings;
use feature 'say';

# @_ is a special array automatically filled with all arguments passed to the sub
sub show_args {
    say "Number of args: " . scalar(@_);   # scalar(@_) = count of arguments
    for my $i (0..$#_) {                   # $#_ = last index of @_
        say "  arg[$i] = $_[$i]";          # access each argument by index
    }
}

show_args("hello", 42, 3.14);   # pass 3 different types of values

# Best practice: unpack @_ into named variables for clarity
sub full_name {
    my ($first, $last) = @_;   # destructure @_ into two named variables
    return "$first $last";      # return combined name
}
say full_name("John", "Doe");   # prints: John Doe

# Variable number of arguments - accept any number
sub sum_all {
    my $total = 0;
    $total += $_ for @_;   # @_ has ALL arguments; add each one to total
    return $total;
}
say "Sum: " . sum_all(1, 2, 3, 4, 5, 6);   # prints: 21

# Mix fixed and variable args: shift removes the first, rest stays in @_
sub log_message {
    my $level = shift;          # remove and get first arg from @_
    my $msg   = join(" ", @_);  # all remaining args joined as message
    say "[$level] $msg";
}
log_message("INFO", "Server", "started", "on port 8080");  # INFO gets first; rest = message
log_message("ERROR", "Connection failed");

# Arrays passed to subs are FLATTENED into @_ (not received as an array)
sub sum_array {
    return sum_all(@_);   # all elements land in @_ flattened
}
my @data = (10, 20, 30);
say "Array sum: " . sum_array(@data);   # @data's elements are all passed individually
