#!usr/bin/perl -Tw
#You need to install the CGI modull first

use strict;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use CGI qw(:standard);
use HTML::Entities;

my $results = 'surveyresult.txt';

my $query = new CGI;

my $user = $query->param("user");

my %data = ();

my $things = '';
my $value = 0;

open (RES, $results) || die("Can't open results file: $!");

while(<RES>){
  ($things,$value) = split(' ');
  $data{$things} = $value;
}
close(RES);

if(not defined($user)){
  $user = "";
}
#Total Score

$data{total}++;
#handle age

if(!param('age')){
  $data{age_na}++;
  else{
   if(param('age') eq 'under18'){
        $data{age_under18}++;
   }elsif(param('age') eq '18to34'){
        $data{age_18to34}++;
   }elsif(param('age') eq '35to50'){
        $data{age_35to50}++;
   }elsif(param('age') eq '50plus'){
        $data{age_50plus}++;
   }
  }
}

if(!param('gender')){
  $data{gender_na}++;
}else{
  if(param('gender') eq 'Male'){
     $data{gender_Male}++;
  }elsif(param('gender') eq 'Female'){
     $data{gender_Female}++;
  }elsif(param('gender') eq 'Trans'){
     $data{gender_Trans}++;
  }
}

if(!param("job")){
  $data{job_na}++;
}else{
  elsif(param('job') eq 'programmer'){
    $data{job_programmer}++;
  }elsif(param('job') eq 'manager'){
    $data{job_manager}++;
  }elsif(param('job') eq 'businessm'){
    $data{job_businessm}++;
  }elsif(param('job') eq 'factoryw'){
    $data{job_factoryw}++;
  }elsif(param('job') eq 'nothing'){
    $data{job_nothing}++;
  }
}

open(RES, ">$results") or die ("Can’t write to results file: $!");
foreach $thing (keys %data){
   print RES "$thing $data{$thing}\n";
}
close(RES);

print header;
print start_html("Thank You");
print <<EOF;
<h1> Thank you $user for filling out our survey!</h1>
<p> The results are: </p>
<p> Gender:
<table border="1"><tr><th>Male</th><td>
EOF

print "<tr><th>Male</th><td>\n";
print &percent('gender_Male'), "</td></tr>\n";
print "<tr><th>Female</th><td>\n";
print &percent('gender_Female'), "</td></tr>\n";
print "<tr><th>Trans</th><td>\n";
print &percent('gender_Trans'), "</td></tr>\n";
print "<tr><th>No Answer</th><td>\n";
print &percent('gender_na'), "</td></tr>\n";
print "</table>\n";

print "<p>Age:\n";
print "<table border=\”1\”><tr><th>Under 18</th><td>\n";
print &percent('age_under18'), "</td></tr>\n";
print "<tr><th>18 to 34</th><td>\n";
print &percent('age_18to34'), "</td></tr>\n";
print "<tr><th>35 to 50</th><td>\n";
print &percent('age_35to50'), "</td></tr>\n";
print "<tr><th>Over 50</th><td>\n";
print &percent('age_50plus'), "</td></tr>\n";
print "<tr><th>No Answer</th><td>\n";
print &percent('age_na'), "</td></tr>\n";
print "</table>\n";

print "<p>What kind of job you are looking for?\n";
print "<table border=\”1\”><tr><th>Programmer</th><td>\n";
print &percent('job_programmer'), "</td></tr>\n";
print "<tr><th>Manager</th><td>\n";
print &percent('job_manager'), "</td></tr>\n";
print "<tr><th>Business Man</th><td>\n";
print &percent('job_businessm'), "</td></tr>\n";
print "<tr><th>Factory Worker</th><td>\n";
print &percent('job_factoryw'), "</td></tr>\n";
print "<tr><th>No Answer</th><td>\n";
print &percent('job_na'), "</td></tr>\n";
print "</table>\n";

print end_html;

sub percent{
 if(defined $data{$_[0]}){
   return sprintf("%.1f%%", $data{$_[0]} / $data{total} * 100);
 }else{
   return "0%";
 }
}

