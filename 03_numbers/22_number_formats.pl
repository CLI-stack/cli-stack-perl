#!/usr/bin/perl
# LESSON 22: Number Formats - Decimal, Hex, Octal, Binary
# Perl can read and write numbers in different bases

use strict;
use warnings;
use feature 'say';

# Perl understands different number LITERALS (how you write numbers in code)
my $decimal = 255;          # normal base-10 number
my $hex     = 0xFF;         # hexadecimal: 0x prefix, digits 0-9 and A-F
my $octal   = 0377;         # octal: leading 0, digits 0-7
my $binary  = 0b11111111;   # binary: 0b prefix, digits 0 and 1

say "Decimal : $decimal";   # prints: 255
say "Hex 0xFF: $hex";       # prints: 255 (same value, different notation)
say "Oct 0377: $octal";     # prints: 255
say "Bin 0b..: $binary";    # prints: 255
say "All equal: " . ($decimal == $hex && $hex == $octal ? "yes" : "no");  # yes - all are 255

# Convert a decimal number TO different bases for display
say "\nConvert 255 to:";
say "Hex  : " . sprintf("%X",   255);     # %X = uppercase hex -> FF
say "Hex lc: " . sprintf("%x",  255);     # %x = lowercase hex -> ff
say "Oct  : " . sprintf("%o",   255);     # %o = octal         -> 377
say "Bin  : " . sprintf("%b",   255);     # %b = binary        -> 11111111
say "Bin 8d: " . sprintf("%08b", 10);     # %08b = binary padded to 8 digits with zeros -> 00001010

# Convert FROM a hex or octal STRING to a number
my $hex_str = "FF";
say "hex('FF') = " . hex($hex_str);       # hex() converts hex string to decimal -> 255

my $oct_str = "377";
say "oct('377') = " . oct($oct_str);      # oct() converts octal string to decimal -> 255
say "oct('0xFF')= " . oct("0xFF");        # oct() also handles 0x prefix (hex) -> 255
say "oct('0b11')= " . oct("0b11");        # oct() also handles 0b prefix (binary) -> 3

# Underscores in large numbers - purely for readability, ignored by Perl
my $million = 1_000_000;    # same as 1000000 but easier to read
my $pi_ish  = 3.141_592_653;  # underscores can go anywhere in a number
say "Million : $million";
say "Pi ish  : $pi_ish";
