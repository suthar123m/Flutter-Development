// Write a Program to check the given year is leap year or not

import 'dart:io';

void main()
{
  int leap_year;

  print("Enter the Leap year == ");
  leap_year = int.parse(stdin.readLineSync()!);

  if(leap_year%4==0)
  {
    print("$leap_year is leap year");
  }
  else
  {
    print("$leap_year is not leap year");
  }

}


