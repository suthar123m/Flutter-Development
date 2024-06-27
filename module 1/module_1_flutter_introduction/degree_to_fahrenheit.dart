import 'dart:io';

void main()
{
  double? degree;
  double fahrenheit;

  print("Enter the value of Degree == ");
  degree = double.parse(stdin.readLineSync()!);

  fahrenheit = (degree*1.8)+32;

  print("Degree to Fahrenheit === $fahrenheit");
}