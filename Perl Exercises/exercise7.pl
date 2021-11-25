
#!/usr/bin/perl
use strict;
use warnings;

# simple_shell
# This script is just an example of a very simple "shell" program.
# Cameron Hayne (macdev@hayne.net)  December 2005

my $version = 0.01;

# Functions
#--------------------------------
sub print_help()
{
    print <<EOT

This "Simple Shell" program is intended for interactive use in a
manner similar to that of the standard UNIX shells.
The only commands it understands are:
help              prints out the info you are currently reading
exit              exits from the shell
ls                lists the contents of the current folder         
man ls            displays the manual page for the program(item) 
EOT
}
sub print_info(){
   print <<EOT

This "Shell" program is intended for use in manner similar to that of the standard UNIX shells.
The man ls command:
man ls      displays the manual page for the program(item)
EOT
}

sub print_prompt()
{
    print "ss> ";
}


MAIN
{
    print "Welcome to ss (Simple Shell) version $version\n",
          "Type: help for help\n";
    print_prompt();

    while (<>)
    {
        chomp;
        my $cmd = $_;

        if ($cmd =~ /^\s*help\s*$/)
        {
            print_help();
        }
        elsif ($cmd =~ /^\s*exit\s*$/)
        {
            exit;
        }
        elsif ($cmd =~ /^\s*ls\s*$/)
        {
            system("ls");
              
        }
        elsif($cmd =~ /^\s*man ls\s*$/){
            print_info();
            system("man ls");
        }
        elsif($cmd =~ /^\s*man -w ls\s*$/){
           print "This is not done we're working on it!\n";
        }
        else
        {
            print "Command not recognized!\n";
        }

        print_prompt();
    }
}

