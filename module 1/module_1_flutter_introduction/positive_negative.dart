
import 'dart:io';


void main()
{
  int? num;

  print("Enter the value of Number == ");
  num = int.parse(stdin.readLineSync()!);

  if(num>0)
  {
    print("output positive");
  }
  else if(num<0)
  {
    print("outptu negative");
  }
  else
  {
    print("output zero");
  }
}