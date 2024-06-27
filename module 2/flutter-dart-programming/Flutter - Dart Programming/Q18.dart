// Write a Program of Addition, Subtraction ,Multiplication and Division using Switch case

import 'dart:io';
void main()
{
  double? num_1;
  double? num_2;
  double? add,multi,sub,div;
  int? choice;

  print("Press 1 for Addition\nPress 2 for Multiplication\nPress 3 for Substraction\nPress 4 for Division");
  print("Enter the your choice == ");
  choice = int.parse(stdin.readLineSync()!);

  print("Enter the value of Number 1 == ");
  num_1 = double.parse(stdin.readLineSync()!);

  print("Enter the value of Number 2 == ");
  num_2 = double.parse(stdin.readLineSync()!);

  switch(choice)
  {
    case 1:
      add = num_1+num_2;
      print("Addition of two number == $add");
      break;
    case 2:
      multi = num_1 * num_2;
      print("Multiplication of two number == $multi");  
      break;
    case 3:
      sub = num_1 - num_2;
      print("Substraction of two number == $sub");
      break;
    case 4:
      div = num_1 / num_2;
      print("Division of two number == $div");
      break;
    default:
      print("Invalid value");    
  }
  
}