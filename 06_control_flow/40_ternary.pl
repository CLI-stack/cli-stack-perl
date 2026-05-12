#!/usr/bin/perl
# LESSON 40: Ternary Operator and Logical Defaults
# Compact way to write simple if/else and assign default values

use strict;
use warnings;
use feature 'say';

# Ternary operator: condition ? value_if_true : value_if_false
my $age    = 20;
my $status = $age >= 18 ? "adult" : "minor";  # pick one of two values
say "Status: $status";                          # prints: adult

say "You are " . ($age >= 18 ? "an adult" : "a minor");  # use inline in print

# Nested ternary - chain multiple conditions (indent clearly for readability)
my $score = 75;
my $grade = $score >= 90 ? "A"    # if score >= 90, grade is A
          : $score >= 80 ? "B"    # else if >= 80, grade is B
          : $score >= 70 ? "C"    # else if >= 70, grade is C
          : $score >= 60 ? "D"    # else if >= 60, grade is D
          :                "F";   # otherwise F
say "Grade: $grade";              # prints: C

# Logical OR for default values
my $name    = undef;              # user's name is not set
my $display = $name || "Anonymous";  # || returns right side when left is falsy
say "Display: $display";             # prints: Anonymous (because undef is falsy)

# PROBLEM: || doesn't distinguish between undef and 0
my $port = 0;                     # port 0 is a valid value
my $p1   = $port || 8080;         # WRONG: 0 is falsy so this uses 8080 instead of 0
my $p2   = $port // 8080;         # CORRECT: // (defined-or) only uses right side if LEFT is UNDEF
say "OR default : $p1";           # prints: 8080 (wrong for port=0)
say "// default : $p2";           # prints: 0    (correct)

# //= assigns default ONLY if variable is currently undef
my $val = undef;
$val //= "default";   # sets to "default" because $val is undef
say "Val: $val";      # prints: default

# &&= sets to right side only if LEFT is true
my $flag = 1;
$flag &&= "yes";      # $flag was 1 (truthy) so replace it with "yes"
say "Flag: $flag";    # prints: yes
