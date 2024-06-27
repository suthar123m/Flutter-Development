import 'dart:io';

void main()
{
  int? A;
  int? B;

  print("Enter the value of A == ");
  A = int.parse(stdin.readLineSync()!);

  print("Enter the value of B == ");
  B = int.parse(stdin.readLineSync()!);

  A = A + B;
  B = A - B;
  A = A - B;

  print("After the swapping of A is == $A");
  print("After the swapping of B is == $B");
}