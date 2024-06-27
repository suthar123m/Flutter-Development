import 'dart:io';

void main()
{
  double? principal;
  double? rate;
  double? time;

  double simple_intrest;

  print("Enter the value of Principal == ");
  principal = double.parse(stdin.readLineSync()!);

  print("Enter the value of interest Rate == ");
  rate = double.parse(stdin.readLineSync()!);

  print("Enter the duration of Time == ");
  time = double.parse(stdin.readLineSync()!);

  simple_intrest = (principal * rate * time)/100;

  print("Simple Interest is == $simple_intrest");
}