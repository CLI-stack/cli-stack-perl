#!/usr/bin/perl
# LESSON 1: Hello World
# This is the first line every Perl script needs - it tells the OS to use Perl

use strict;    # forces you to declare all variables - prevents typo bugs
use warnings;  # tells Perl to warn you about risky or undefined behavior

print "Hello, World!\n";  # print sends text to screen; \n means newline (go to next line)
print "Welcome to Perl!\n";  # you can call print as many times as you want

use feature 'say';         # load the 'say' feature from Perl's standard library
say "This uses say()";     # say() is like print but automatically adds \n at the end
say "No need for \\n";     # \\ prints a literal backslash character in the output
