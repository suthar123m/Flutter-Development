import 'dart:io';

void main()
{
  double? redius;
  double area_of_circle;
  double pi=3.14;

  print("Enter the value of Redius == ");
  redius = double.parse(stdin.readLineSync()!);

  area_of_circle = (pi * redius * redius);
  print("Area of circle == $area_of_circle");  
}