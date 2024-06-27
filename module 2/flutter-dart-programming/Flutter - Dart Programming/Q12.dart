//Write a Program to check the given number is prime or not prime

import 'dart:io';

void main() {
  int Num;
  
  print('Enter a Number');
  Num = int.parse(stdin.readLineSync()!);
  
  if (isPrime(Num)) 
  {
    print('$Num is a prime number.');
  } 
  else 
  {
    print('$Num is not a prime number.');
  }
}

bool isPrime(Num) {
  for (var i = 2; i <= Num / i; ++i) 
  {
    if (Num % i == 0) 
    {
      return false;
    }
  }
  return true;
}