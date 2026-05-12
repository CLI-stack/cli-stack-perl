#!/usr/bin/perl
# LESSON 71: Scalar References
# A reference is a pointer - it stores the LOCATION of another variable

use strict;
use warnings;
use feature 'say';

my $name = "Alice";   # a regular scalar variable

# Create a reference to $name using the backslash operator \
my $ref = \$name;   # $ref now holds the memory address of $name

say "Value of \$name  : $name";    # Alice (the actual value)
say "Value of \$ref   : $ref";     # SCALAR(0x...) - the memory address
say "Deref with \$\$ref: $$ref";    # Alice - $$ dereferences: "go to address and get value"
say "Deref with \${}: "  . ${$ref};  # Alice - ${$ref} is the explicit dereference form

# Modifying the VALUE through the reference changes the original variable
$$ref = "Bob";                    # write a new value through the reference
say "After modify via ref: $name";  # prints "Bob" - $name was changed!

# ref() function tells you what TYPE of reference you have
say "Type of ref: " . ref($ref);   # prints: SCALAR

# References to numbers
my $num  = 42;
my $nref = \$num;      # reference to a number
$$nref  *= 2;          # double the value through the reference
say "Doubled via ref: $num";   # 84 - $num was modified

# Anonymous references - references to values without a named variable
my $anon    = \42;            # reference to the literal value 42
say "Anon ref value: $$anon"; # 42

my $str_ref = \"Hello World";         # reference to a string literal
say "String ref: $$str_ref";           # Hello World
say "Length via ref: " . length($$str_ref);  # deref gives the string, then length() measures it

# ref() returns empty string for non-references
sub check_ref {
    my $r = shift;
    if (ref $r) {                            # ref() returns truthy string for refs
        say "Is a " . ref($r) . " reference";
    } else {
        say "Not a reference: '$r'";
    }
}

check_ref($ref);          # prints: Is a SCALAR reference
check_ref("plain string");  # prints: Not a reference
