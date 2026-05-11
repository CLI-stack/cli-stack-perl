#!/usr/bin/perl
# LESSON 96: die and warn - Basic Error Handling

use strict;
use warnings;
use feature 'say';

# warn - prints to STDERR but continues execution
warn "This is a warning - script keeps running\n";
say "Script continued after warn";

# die - prints to STDERR and terminates (exits with code 1)
# die "This would stop the script\n";

# die with $! (errno message from OS)
# open(my $fh, '<', '/nonexistent') or die "Cannot open: $!";

# Practical: validate input
sub divide {
    my ($a, $b) = @_;
    die "Division by zero!\n" if $b == 0;
    return $a / $b;
}

# Wrapping in eval catches die (don't let it kill the script)
my $result = eval { divide(10, 2) };
if ($@) {
    say "Error: $@";
} else {
    say "10 / 2 = $result";
}

$result = eval { divide(10, 0) };
if ($@) {
    chomp(my $err = $@);
    say "Caught error: $err";
}

# Cascading error messages with die
sub open_file {
    my $path = shift;
    open(my $fh, '<', $path) or die "open_file('$path') failed: $!\n";
    return $fh;
}

sub process_file {
    my $path = shift;
    my $fh = eval { open_file($path) };
    if ($@) {
        warn "process_file: $@";
        return undef;
    }
    return "OK";
}

my $r = process_file("/nonexistent/file.txt");
say "Result: " . (defined $r ? $r : "failed");

# Carp module for better error reporting (shows caller's location)
use Carp qw(carp croak confess cluck);
# carp  = warn from caller's perspective
# croak = die  from caller's perspective
# confess = die with full stack trace
# cluck   = warn with full stack trace
