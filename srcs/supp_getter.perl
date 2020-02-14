#!/usr/bin/perl

use strict;

my $string;
while(<>){
   $string .= $_;
}

my @matches = ($string =~ m/({[^}]+}\n)/scg);
print join("\n", @matches);
