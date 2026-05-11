#!/usr/bin/perl
# LESSON 22: Number Formats - Hex, Octal, Binary

use strict;
use warnings;
use feature 'say';

# Perl understands different number literals
my $decimal = 255;
my $hex     = 0xFF;     # hexadecimal (0x prefix)
my $octal   = 0377;     # octal (0 prefix)
my $binary  = 0b11111111;  # binary (0b prefix)

say "Decimal : $decimal";
say "Hex 0xFF: $hex";
say "Oct 0377: $octal";
say "Bin 0b..: $binary";
say "All equal: " . ($decimal == $hex && $hex == $octal ? "yes" : "no");

# Convert TO different bases
say "\nConvert 255 to:";
say "Hex  : " . sprintf("%X",  255);     # FF
say "Hex lc: " . sprintf("%x", 255);     # ff
say "Oct  : " . sprintf("%o",  255);     # 377
say "Bin  : " . sprintf("%b",  255);     # 11111111
say "Bin 8d: " . sprintf("%08b", 10);    # 00001010

# Convert FROM hex/oct string
my $hex_str = "FF";
say "hex('FF') = " . hex($hex_str);    # 255

my $oct_str = "377";
say "oct('377') = " . oct($oct_str);   # 255 (octal)
say "oct('0xFF')= " . oct("0xFF");     # 255 (hex with prefix)
say "oct('0b11')= " . oct("0b11");     # 3   (binary with prefix)

# Underscores in large numbers (for readability)
my $million = 1_000_000;
my $pi_ish  = 3.141_592_653;
say "Million : $million";
say "Pi ish  : $pi_ish";
