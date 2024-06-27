// Write a program you have to print the table of given number

import 'dart:io';

void main()
{
  int num_1,num_2;

  print("Enter the number of Table == ");
  num_1 = int.parse(stdin.readLineSync()!);

  for(num_2=1;num_2<=10;num_2++)
  {
    print("$num_1 * $num_2 * ${num_1*num_2}");
  }
}