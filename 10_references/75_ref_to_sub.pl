#!/usr/bin/perl
# LESSON 75: References to Subroutines

use strict;
use warnings;
use feature 'say';

# Reference to a named subroutine
sub double { return $_[0] * 2 }
sub square { return $_[0] ** 2 }
sub negate { return -$_[0]    }

my $dbl = \&double;   # note: \& for sub reference
my $sq  = \&square;
my $neg = \&negate;

say "double(5): " . $dbl->(5);
say "square(5): " . $sq->(5);
say "negate(5): " . $neg->(5);

say "ref type: " . ref($dbl);   # CODE

# Store subs in a hash (dispatch table)
my %ops = (
    double => \&double,
    square => \&square,
    negate => \&negate,
    triple => sub { $_[0] * 3 },   # anonymous inline
);

my $input = 7;
for my $op (sort keys %ops) {
    printf "  %-8s(%d) = %d\n", $op, $input, $ops{$op}->($input);
}

# Higher-order functions
sub apply {
    my ($func, @args) = @_;
    return $func->(@args);
}

say "\napply double 6: " . apply(\&double, 6);
say "apply square 4: " . apply(\&square, 4);

# Array of code refs (pipeline)
my @pipeline = (
    sub { $_[0] * 2   },
    sub { $_[0] + 10  },
    sub { $_[0] ** 2  },
);

my $val = 3;
say "\nPipeline starting with $val:";
for my $step (@pipeline) {
    $val = $step->($val);
    say "  => $val";
}
