import 'dart:io';

void main()
{
  double? base;
  double? hight;
  double area_of_tringle;

  print("Enter the value of Base == ");
  base = double.parse(stdin.readLineSync()!);

  print("Enter the value of Hight == ");
  hight = double.parse(stdin.readLineSync()!);

  area_of_tringle = (hight*base)/2;

  print("Area of tringle == $area_of_tringle");
}