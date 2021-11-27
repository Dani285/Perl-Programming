#!usr/bin/perl -w

$store = "";
%prop = ();
$file = "wiki.html";

open (IN, "<$file") || die("The file cannot be opened\n");

while (<IN>){
  while (/<img\s(.+?)>/igs){
     $store=$1;
     while ($store=~/([^ =]+)\s*=\s*(“([^”]+)”|[^\s]+\s*)/igx){
           if(defined $3){
              $prop{lc($1)} = $3;
           }else{
              $prop{lc($1)} = $2;
           }
     }
      	   print "\n";
	   print "Images: $prop{'src'}\n";
	   print "\n";
	   foreach $keys('src'){
	       if (exists($prop{$keys})){
		   $prop{$keys}=~ s/\S*/Huskiesatrest.jpg/;
		   print"Replace To: $prop{$keys}\n";
	   } 
	}
	%prop = ();
   }
}
 close(IN);
