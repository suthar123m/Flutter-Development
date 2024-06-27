import 'dart:io';

void main()
{
  int? A;
  int square;
  int cube;
  
  print("Enter the value of A == ");
  A = int.parse(stdin.readLineSync()!);

  square = A * A;
  print("Square of A is == $square");

  cube = A * A * A;
  print("Cube of A is == $cube");

}