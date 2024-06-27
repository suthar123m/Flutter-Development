// Write a program to find the Max number from the given three number using Nested If

import 'dart:io';

void main()
{
  int num_1;
  int num_2;
  int num_3;

  print("Enter the value of Number 1 == ");
  num_1 = int.parse(stdin.readLineSync()!);

  print("Enter the value of Number 2 == ");
  num_2 = int.parse(stdin.readLineSync()!);

  print("Enter the value of Number 3 == ");
  num_3 = int.parse(stdin.readLineSync()!);

  if(num_1>num_2)
  {
    if(num_1>num_3)
    {
      print("$num_1 is greater : ");
    }
  }
  else if(num_2>num_3)
  {
    print("$num_2 is greater : ");
  }
  else
  {
    print("$num_3 is greater : ");
  }
}