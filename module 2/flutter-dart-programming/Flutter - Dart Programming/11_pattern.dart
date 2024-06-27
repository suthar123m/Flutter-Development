import 'dart:io';

void main() {
  int row, col, count = 1;
  for (row = 1; row <= 5; row++) {
    for (col = 1; col <= row; col++) {
      if (count % 2 == 0) {
        stdout.write("0 ");
      } else {
        stdout.write("1 ");
      }
      count++;
    }
    print("");
  }
}
