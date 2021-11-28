#!/usr/bin/perl

package Person;

sub new{
  my $class = shift;
  my $self = {
    _firstName => shift,
    _lastName => shift,
    _phoneNumber   => shift,
  };
  #print all values
  
  print "First Name is $self->{_firstName}\n";
  print "Last Name is $self->{_lastName}\n";
  print "Phone number is $self->{_phoneNumber}\n";
  bless $self,$class;
  return $self;
}

sub setSurname{
  my ($self,$firstName) = @_;
  $self->{_firstName} = $firstName if defined($firstName);
  return $self->{_firstName};
}

sub getSurname{
  my ($self) = @_;
  return $self->{_firstName};
}

sub setLastName{
  my($self,$lastName) = @_;
  $self->{_lastName} = $lastName if defined($lastName);
  return $self->{_firstName};
}

sub getLastName{
  my ($self) = @_;
  return $self->{_lastName};
}

sub setPhoneNumber{
  my($self,$phoneNumber) = @_;
  $self->{_phoneNumber} = $phoneNumber if defined($phoneNumber);
  return $self->{_phoneNumber};
}

sub getPhoneNumber{
   my ($self) = @_;
   return $selft->{_phoneNumber}
}
