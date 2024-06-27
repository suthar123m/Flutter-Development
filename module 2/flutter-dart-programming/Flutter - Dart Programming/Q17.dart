// Write Program use switch statement. Display Monday to Sunday

import 'dart:io';

void main()
{
  int? days;

  print("Enter the number of days == ");
  days = int.parse(stdin.readLineSync()!);

  switch(days)
  {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Thusday");
      break;
    case 3:
      print("Wednesday");    
      break;
    case 4:
      print("Thrusday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
      print("Saterday");
      break;
    case 7:
      print("Sunday");
      break;
    default:
    print("indalid input");          
  }
}