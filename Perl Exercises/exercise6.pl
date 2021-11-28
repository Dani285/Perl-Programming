#!usr/bin/perl -w

# The program is get the html content from WHO webpage and print some information about COVID-19.

use strict;
use warnings;

use LWP::Simple;            # Using word wide web tools

my $url = "https://covid19.who.int/";
my $contents = get($url) or die("Couldn't fetch the data");      # getting the data
my @matches;

# Go to check the contents
            
 if($contents=~ /(?<=<p>)(.*?)(?=<\/p>)/g){          #/(?<=<p>)(.*?)(?=<\/p>)/g
    push(@matches,$1);     # when we find a match, we put the finded content to the matches array
}

foreach my $data(@matches){                           #s/<.*?>//gs
  $data =~s/<.*?>//gs;   #for each matches we remove html tags, and just the plain text is the output
  print ("$data\n");
} 
