import 'dart:io';

void main() {
  int row, col, k;
  for (row = 1; row <= 5; row++) {
    for (k = 5; k >= row; k--) {
      stdout.write(" ");
    }
    for (col = row; col >= 1; col--) {
      stdout.write(col);
    }
    print("");
  }
}
