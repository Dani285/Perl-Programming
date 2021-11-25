#!usr/bin/perl -w

use strict;
use warnings;


my $counter = 1;
sub Itself(){
  open (FH, "<","$0") or die("Could not open the file!");
  while(<FH>){
  	my $contents = $_;
  	print "$counter.$contents\n";
     	$counter++;
  }
}

my $itself = &Itself();
print $itself;
