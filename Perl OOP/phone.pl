#!/usr/bin/perl

use Person;

$obj = new Person("Barney","Stinson",202-555-0107);

$surname = $obj->getSurname();
$lastName = $obj->getLastName();
$phoneNumber = $obj->getPhoneNumber();
print "$surname $lastName first name is: $surname, and his phone number is $phoneNumber.\n";

# Set the first name using helper function

$obj->setSurname("Chandler");            #Optional you can comment it if disturbs you
$obj->setLastName("Bing");      
$obj->setPhoneNumber(732-280-1435);

# Get first name set by helper function

$surname = $obj->getSurname();

$lastName = $obj->getLastName();

$phoneNumber = $obj->getPhoneNumber();

print "$surname $lastName first name is: $surname, and his phone number is $phoneNumber.\n";
