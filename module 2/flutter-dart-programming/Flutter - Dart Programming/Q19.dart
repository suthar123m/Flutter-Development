// Write a program of to find out the Area of Triangle, Rectangle and Circle using If Condition

import 'dart:io';

void main()
{
  double? area_of_tringle;
  double? area_of_rectangle;
  double? area_of_circle;

  double? redius,breadth,hight,lenght,width;

  int? choice;

  print("Press 1 for Area of Tringle\nPress 2 for Area of Rectangle\nPress 3 for Area of Circle");

  print("Enter your choice == ");
  choice=int.parse(stdin.readLineSync()!);

  if(choice == 1)
  {
    print("Enter the Breadth == ");
    breadth = double.parse(stdin.readLineSync()!);
    print("Enter the Hight == ");
    hight = double.parse(stdin.readLineSync()!);
    area_of_tringle = (0.5 * breadth * hight);
    print("Area of Tringle == $area_of_tringle");
  }
  else if(choice == 2)
  {
    print("Enter the Lenght == ");
    lenght = double.parse(stdin.readLineSync()!);
    print("Enter the Width == ");
    width = double.parse(stdin.readLineSync()!);
    area_of_rectangle = (lenght * width);
    print("Area of Rectangle == $area_of_rectangle");
  }
  else if(choice == 3)
  {
    print("Enter the Redius == ");
    redius = double.parse(stdin.readLineSync()!);
    area_of_circle = (3.14 * redius * redius);
    print("Area of Circle == $area_of_circle");
  }
  else
  {
    print("invalid data");
  }

  


}