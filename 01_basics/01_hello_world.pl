#!/usr/bin/perl
# LESSON 1: Hello World
# Every Perl script starts with the shebang line above.
# 'use strict' and 'use warnings' are best practices - always include them.

use strict;
use warnings;

print "Hello, World!\n";  # \n = newline
print "Welcome to Perl!\n";

# say() is like print but adds newline automatically
use feature 'say';
say "This uses say() - no need for \\n";
