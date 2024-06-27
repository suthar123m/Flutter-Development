// Write a program you have to print the Fibonacci series up to user given number

import 'dart:io';

void main()
{
  int a = 0,b = 1,c;
  int i,num;

  print("Enter the Number == ");
  num = int.parse(stdin.readLineSync()!);

  print("Fibonacci Series == ");
  for(i=1;i<=num;i++)
  {
    print("$a");
    c = a + b;
    a = b;
    b = c;
  }
}