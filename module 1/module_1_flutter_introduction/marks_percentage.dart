import 'dart:io';

void main()
{
  int? maths;
  int? hindi;
  int? science;
  int? english;
  int? s_science;
  int total;
  double percentage;

  print("Enter the marks of maths == ");
  maths = int.parse(stdin.readLineSync()!);

  print("Enter the marks of hindi == ");
  hindi = int.parse(stdin.readLineSync()!);

  print("Enter the marks of science == ");
  science = int.parse(stdin.readLineSync()!);

  print("Enter the marks of english == ");
  english = int.parse(stdin.readLineSync()!);

  print("Enter the marks of social science == ");
  s_science = int.parse(stdin.readLineSync()!);

  total = maths+hindi+english+science+s_science;
  print("Total number of all subject == $total");

  percentage = (total/500)*100;

  print("Percentage of total subject is == $percentage");

}