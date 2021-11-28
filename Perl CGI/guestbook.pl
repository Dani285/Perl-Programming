#!usr/bin/perl

#Guest Book with Perl CGI
#You need to install a CGI modull first

use strict;
use warnings;

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use HTML::Entities;

#Configure this for your system

my $visitfile = "/temp/visit.list";

my $query = new CGI;

my $User = $query->param("user");

# Email of the user
my $Email = $query->param("email");

if(not defined($User)){
  $User = "";
}

if(not defined($email)){
  $Email = "";
}

# Untaint the environment

$ENV{PATH} = "/bin:/usr/bin";
delete ($ENV(qw(IFS CDPATH BASH_ENV ENV)));

# If there a user is defined, record it

if($User != ""){
  open  OUT, ">>$visitfile" || die("Could not write the visito file");
  
  print OUT "$User\t$Email\n";
  
  close OUT;
  
  # Turn the user into HTML
  
  $User = HTML::Entities::encode($User);
  
  # Get the visitor number from the file
  
  my $visitor = `wc -l $visitfile`;
  
  # Remove leading spaces
  
  $visitor =~ s/^\s+//;
  
  #Get the number of lines in the file
  
  my @number = split /\s+/, $visitor;
  
  print <<EOF;
Content-type: text/html

<html>
<head>
     <title> Guest Book </TITLE>
</head>
<body bgcolor="#FFFFFF">
<p>
  Thank you $User. Your name has been recorded.
</>
You are a visitor number $number[0]
EOF
   exit(0);
}

print <<EOF;
Content-type: text/html

<html>
<head>
   <title>Guest Book </title>
</head>

<body bgcolor="#FFFFFF">
<p>
  Please sign the guest book;
  <form method="post" action="guestbook.pl" name="guest">
    <p> Your name:
      <input type="text" name="user">
    </p>
    
    <p> Your Email address:
      <input type="text" name="email">(Optional)
    </p>
    
    <p>
      <input type="submit" name="Submit" value="Submit">
    </p>
  </form>
 </p>
</body>
</html>
EOF


