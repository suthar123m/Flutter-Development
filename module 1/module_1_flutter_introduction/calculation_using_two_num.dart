import 'dart:io';

void main()
{
  int? a;
  int? b;

  int add,sub,multi;
  double div;
  
  print("Enter the value of A == ");
  a = int.parse(stdin.readLineSync()!);

  print("Enter the value of B == ");
  b = int.parse(stdin.readLineSync()!);

  add = a + b;
  print("Addition of two number A and B is == $add");

  sub = a - b;
  print("Substraction of two number A and b is == $sub");

  multi = a * b;
  print("Multipal of two number A and B == $multi");

  div = a / b; 
  print("Divition of two number A and B is == $div");
}