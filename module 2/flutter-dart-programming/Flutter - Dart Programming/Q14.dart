// Write a program to find the Max number from the given three number using Ternary Operator

import 'dart:io';

void main()
{
  int num_1;
  int num_2;
  int num_3;
  int max;
  print("Enter the value of Number 1 == ");
  num_1 = int.parse(stdin.readLineSync()!);

  print("Enter the value of Number 2 == ");
  num_2 = int.parse(stdin.readLineSync()!);

  print("Enter the value of Number 3 == ");
  num_3 = int.parse(stdin.readLineSync()!);

  max = num_1 > num_2 ? (num_1 > num_3 ? num_1 : num_3) : (num_2 > num_3 ? num_2 : num_3);

  print("Maximum number is == $max"); 
  
}