#!/usr/ bin/perl -w
#Original Srcipt - You need to modify it

use strict;
use warnings;


if ($#ARGV != 0){ 
    print "Usage $0 <words.txt>\n";
    exit(8);
}

open IN, "<$ARGV[0]" or die("Cannot opened $ARGV[0] for reading");

my @list; # list of questions and answers


while(<IN>){ 
             chomp;
	      my @words=split /\t/;
	      if ($#words!=1){
		   die("Wrong input $_");
		}
	   	push(@list,
		{
	 	  questions => $words[0],
	 	  answers => $words[1],
		});
}
# Question-Answer
# Ask the question until there are no more

while ($#list>-1){
	print "Translate to Spanish: $list[0]->{questions}\n";
	print "My answer:";
	my $answers = <STDIN>; 
	chomp($answers);
	if ($answers eq $list[0]->{answers}){
		print "Right answer the answer was $list[0]->{answers}\n\n";
		shift(@list); next;
	}
	print "Wrong, the right answer is: $list[0]->{answers} \n\n";
	push(@list, shift(@list));
}
print "That was for today all done! \n";
