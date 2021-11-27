#!/usr/ bin/perl -w

#The usage of this script:
#1. Open Terminal
#2. Download words.txt file
#3. Type the following to the terminal: perl exercise9.pl words.txt

use strict;
use warnings;
use List::Util qw(shuffle);        #this is an alternative solution

# Practice foreign words

# srand();
if ($#ARGV != 0){ 
    print "Usage $0 <words.txt>\n";
    exit(8);
}
open IN, "<$ARGV[0]" or die("Could not open $ARGV[0] for reading");

my @list; # list of questions and answers


while(<IN>){ 
	chomp;
	my @words= split /\t/;
	if($#words != 1){
	   die("Wrong input $_");
	}
	push(@list,
	{
	 questions => $words[0],
	 answers => $words[1],
	});
}
# Question-Answer
#Ask the question until there are no more

while ($#list>-1){
	@list = shuffle(@list);
	# my $rnd = int(rand(15))+1;
	print "Translate to Spanish: $list[0]->{questions}\n";      #print "Translate to Spanish: $list[$rnd]->{questions}\n";
	print "My answer:";
	my $answers = <STDIN>; 
	chomp($answers);
	   if ($answers eq $list[0]->{answers})                    #if($answers eq $list[$rnd]->{answers})
	      {
		print "Right answer the answer was $list[0]->{answers}\n\n";
		shift(@list);
		next;
	      }else{
	      	print "Wrong answer the correct answer is: $list[0]->{answers}\n\n";
	        push(@list, shift(@list));
	        until($answers ne $list[0]->{answers}){
	           push(@list,$list[0]->{questions});
	        }
	    }
}
print "That was for today all done!\n";
