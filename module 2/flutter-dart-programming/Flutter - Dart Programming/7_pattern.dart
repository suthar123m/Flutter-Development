import 'dart:io';

void main() {
  int row, col, k;
  for (row = 1; row <= 5; row++) {
    for (k = 5; k >= row; k--) {
      stdout.write(" ");
    }
    for (col = 1; col <= row; col++) {
      stdout.write("* ");
    }
    print("");
  }
}
