/*
Write a program user enter the 5 subjects mark. You have to make a 
total and find the percentage. percentage > 75 you have to print 
“Distinction” percentage > 60 and percentage <= 75 you have to
print “First class” percentage >50 and percentage <= 60 you have to 
print “Second class” percentage > 35 and percentage <= 50 you have to 
print “Pass class” Otherwise print “Fail”
*/

import 'dart:io';

void main() {
  int? Hindi;
  int? English;
  int? Maths;
  int? Science;
  int? S_Science;

  int total;
  double percentage;
  print("Enter the marks of Hindi == ");
  Hindi = int.parse(stdin.readLineSync()!);

  print("Enter the marks of English == ");
  English = int.parse(stdin.readLineSync()!);

  print("Enter the marks of Maths == ");
  Maths = int.parse(stdin.readLineSync()!);

  print("Enter the marks of Science == ");
  Science = int.parse(stdin.readLineSync()!);

  print("Enter the marks of Social Science == ");
  S_Science = int.parse(stdin.readLineSync()!);

  total = Hindi + English + Maths + Science + S_Science;
  print("Total marks of all subject is $total");

  percentage = total * 100 / 500;
  print("Percentage of Total marks is $percentage");

  if (percentage > 70) {
    print("Distinction");
  } else if (percentage <= 70 && percentage > 60) {
    print("First class");
  } else if (percentage <= 60 && percentage > 50) {
    print("Second class");
  } else if (percentage <= 50 && percentage > 35) {
    print("Pass class");
  } else {
    print("Fail");
  }
}
