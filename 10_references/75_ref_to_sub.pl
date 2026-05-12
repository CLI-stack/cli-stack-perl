#!/usr/bin/perl
# LESSON 75: References to Subroutines
# You can store and pass subroutines just like any other value

use strict;
use warnings;
use feature 'say';

# Create references to named subroutines using \&subname
sub double { return $_[0] * 2   }
sub square { return $_[0] ** 2  }
sub negate { return -$_[0]      }

my $dbl = \&double;   # \& creates a reference to a named subroutine
my $sq  = \&square;
my $neg = \&negate;

say "double(5): " . $dbl->(5);   # ->() calls the sub reference with argument 5
say "square(5): " . $sq->(5);    # 25
say "negate(5): " . $neg->(5);   # -5
say "ref type  : " . ref($dbl);  # prints: CODE (the type for all sub references)

# Hash dispatch table: map names to code refs
# This is Perl's answer to switch/case with callable actions
my %ops = (
    double => \&double,                    # reference to named sub
    square => \&square,
    negate => \&negate,
    triple => sub { $_[0] * 3 },          # anonymous sub inline - no name needed
);

my $input = 7;
say "\nApply all operations to $input:";
for my $op (sort keys %ops) {
    printf "  %-8s(%d) = %d\n", $op, $input, $ops{$op}->($input);  # call each code ref
}

# Higher-order function: a sub that RECEIVES another sub as an argument
sub apply {
    my ($func, @args) = @_;   # first arg is the code ref, rest are data
    return $func->(@args);    # call the code ref with the data arguments
}

say "\napply double to 6: " . apply(\&double, 6);   # 12
say "apply square to 4: " . apply(\&square, 4);    # 16

# Pipeline: array of code refs applied in sequence
my @pipeline = (
    sub { $_[0] * 2  },    # step 1: double
    sub { $_[0] + 10 },    # step 2: add 10
    sub { $_[0] ** 2 },    # step 3: square
);

my $val = 3;
say "\nPipeline starting with $val:";
for my $step (@pipeline) {
    $val = $step->($val);   # call each step, passing result of previous as input
    say "  => $val";
}
