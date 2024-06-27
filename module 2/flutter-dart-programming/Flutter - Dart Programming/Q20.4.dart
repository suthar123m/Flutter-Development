// Write a program you have to find the factorial of given number

import 'dart:io';
void main()
{
  int fectorial = 1;
  int i,num;

  print("Enter the value of Numer == ");
  num = int.parse(stdin.readLineSync()!);

  for(i=1;i<=num;i++)
  {
    fectorial *= i;
  }
  print("Fectorial == $fectorial");
  
}