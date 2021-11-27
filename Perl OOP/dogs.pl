#!/usr/bin/perl

$run = True;
%dogs = ();

while($run eq True)
{
	@unique = keys %dogs;
	
	print "------------------------\n";
	print "------------------------\n";
	print "Defined dogs: @unique\n";
	print "----------Menu----------\n";				
			
	print "Choice: ";
	$inp = <STDIN>;
	chomp($inp);
		
	if ($inp==1) 
		{
			print "The dog name is: ";
			$name = <STDIN>;
			chomp($name);	
			$dogs{$name} = Dog->Create($name);
		}
	elsif ($inp==2) 
		{
			print "The dog name is: ";
			$name = <STDIN>;
			chomp($name);
			
     		
     			eval 
     			{
       			print "------------------------\n";			
				print $dogs{$name}->State();
			};
     		
     			if ($@) 
     			{
		  		print "There's no dog!\n";
			}
			
		}
		elsif ($inp==3) 
		{
			print "The dog name is : ";
			$name = <STDIN>;
			chomp($name);
			
			print "What kind of feed we add to the dog: ";
			$food = <STDIN>;
			chomp($food);
						
			eval 
     			{
       			print "------------------------\n";			
				print $dogs{$name}->Feed($food);
			};
     		
     			if ($@) 
     			{
		  		print "There's no dog!\n";
			}
		}
		elsif ($inp==4) 
		{
			print "The Selected dog is: ";
			$name1 = <STDIN>;
			chomp($name1);
			
			print "Another dog name: ";
			$name2 = <STDIN>;
			chomp($name2);
			
			
			$isKey = False;
			foreach  $p (@unique)
			{
				if($p eq $name2) { $isKey = True; }
			}
			
			eval 
     			{
     			if($isKey ne True || $name1 eq $name2)
     			{
     				die "";     				     				     				
     			}
     			else
     			{
	       			print "------------------------\n";		
					print $dogs{$name1}->Fight( $dogs{$name2} );     				
     			}     							
     		};
     		
     		if ($@) {print "Error in typing!\n";	}	
		}
		else {	$run = False;	}	
}	



package Dog;

sub Create
{
    my ($type,$name) = @_;
    
    $nm = "Anonym dog";
    $nm = $name if defined($name);
    
    my $self = { hung, 5, agr, 5, name, $nm};
    bless $self, $type;   
    return $self;
}

# bless REF,CLASSNAME
# bless REF


sub State()
{
    my ($self) = @_;
    
    return "$self->{name}-> hungry: $self->{hung}, angry: $self->{agr}\n";   
}


sub Agr() 
{
    my ($self) = @_;
    return $self->{agr};
}


sub SetAgr() 
{
    my ($self, $amount) = @_;
    $sum = $self->{agr} + $amount;
    
    if( $sum > 10 ) { $self->{agr} = 10; }
    elsif( $sum < 0 ) { $self->{agr} = 0; }
    else { $self->{agr} = $sum; }    
}


sub Hung() 
{
    my ($self) = @_;
    return $self->{hung};
}

sub SetHung() 
{
    my ($self, $amount) = @_;
    $sum = $self->{hung} + $amount;
    
    if( $sum > 10 ) { $self->{hung} = 10; }
    elsif( $sum < 0 ) { $self->{hung} = 0; }
    else { $self->{hung} = $sum; }    
}

sub Name() 
{
    my ($self) = @_;
    return $self->{name};
}

sub Feed()
{
    my ($self) = shift;
    my $food = shift;
    $message = "";
    
    if($food eq "")
    {
	$self->SetAgr(1);
        $message = "$self->{name}-> food: $food - this is not enough!\n";
    }	    
    elsif($food eq "cat")
    {
		$self->SetHung(-2);
		$self->SetAgr(1);
	
		$message = "$self->{name}-> food: $food - this is enough!\n"
    }
    else
    {    
		$self->SetHung(-1);
	
		$message = "$self->{name}-> food: $food - finaly something!\n";
    }
    
    return $message;
}


sub Fight()
{
    my ($self,$other) = @_;
    $message = "";
    
    $other_agr = "0";
    $other_agr = $other->{agr} if defined($other);
    if($other_agr eq 0) 
    { 
    	return "There was no fight!\n";
    }
    
    $message = "$self->{name} vs. $other->{name}\n";
    
    if($self->{agr} < $other_agr)
    {
		$message = "$message$self->{name}-> I'll go away!\n";	
		
		$self->SetAgr(-2);		
		$self->SetHung(1);
    }
    else
    {	
		$message = "$message$self->{name}-> I win!\n";
			    
		$self->SetAgr(-2);		
		$self->SetHung(2);
    }
    
    return $message;
}
			      
