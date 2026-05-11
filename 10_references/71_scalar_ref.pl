#!/usr/bin/perl
# LESSON 71: Scalar References

use strict;
use warnings;
use feature 'say';

# A reference is a pointer to another variable
my $name = "Alice";

# Create a reference with \
my $ref = \$name;

say "Value : $name";
say "Ref   : $ref";          # SCALAR(0x...)
say "Deref : $$ref";         # Alice (dereference with $$)
say "Deref : ${$ref}";       # Alice (alternate form)

# Modify through reference
$$ref = "Bob";
say "After modify via ref: $name";   # Bob

# ref() tells you what type a reference points to
say "Type: " . ref($ref);   # SCALAR

# Reference to a number
my $num = 42;
my $nref = \$num;
$$nref *= 2;
say "Doubled via ref: $num";   # 84

# Anonymous scalar reference (no named variable)
my $anon = \42;
say "Anon ref: $$anon";

my $str_ref = \"Hello World";
say "String ref: $$str_ref";
say "Length via ref: " . length($$str_ref);

# Check if something is a reference
sub check_ref {
    my $r = shift;
    if (ref $r) {
        say "Is a " . ref($r) . " reference";
    } else {
        say "Not a reference: $r";
    }
}

check_ref($ref);
check_ref("plain string");
check_ref(42);
