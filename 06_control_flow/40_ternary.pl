#!/usr/bin/perl
# LESSON 40: Ternary Operator and Logical Short-Circuit

use strict;
use warnings;
use feature 'say';

# Ternary: condition ? value_if_true : value_if_false
my $age = 20;
my $status = $age >= 18 ? "adult" : "minor";
say "Status: $status";

# Inline in print
say "You are " . ($age >= 18 ? "an adult" : "a minor");

# Nested ternary (use cautiously)
my $score = 75;
my $grade = $score >= 90 ? "A"
          : $score >= 80 ? "B"
          : $score >= 70 ? "C"
          : $score >= 60 ? "D"
          :                "F";
say "Grade: $grade";

# Logical OR for defaults (// is better for undef)
my $name = undef;
my $display = $name || "Anonymous";   # use left if truthy, else right
say "Display: $display";

# // (defined-or) - better than || when 0 is valid
my $port = 0;
my $p1 = $port || 8080;    # 8080 (wrong! 0 is falsy)
my $p2 = $port // 8080;    # 0    (correct! 0 is defined)
say "OR default : $p1";
say "// default : $p2";

# &&= and ||= shortcuts
my $val = undef;
$val //= "default";   # assign only if undef
say "Val: $val";

my $flag = 1;
$flag &&= "yes";   # keep right side only if $flag was true
say "Flag: $flag";
