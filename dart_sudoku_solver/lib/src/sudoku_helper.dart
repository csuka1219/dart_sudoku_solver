import 'dart:io';

List<int> makeListNonNullableAndReplaceNullsWithZero(List<int?> nullableList) {
  return List<int>.from(nullableList.map((element) => element ?? 0));
}

void printSudoku(List<int?> solution) {
  if (solution.length != 81) {
    print("Invalid Sudoku list length");
    return;
  }

  for (int row = 0; row < 9; row++) {
    if (row % 3 == 0 && row != 0) {
      print("-" * 21);
    }
    for (int col = 0; col < 9; col++) {
      if (col % 3 == 0 && col != 0) {
        stdout.write("| ");
      }
      final index = row * 9 + col;
      final value = solution[index];
      if (value == null || value == 0) {
        stdout.write(". ");
      } else {
        stdout.write("$value ");
      }
    }
    stdout.write("\n");
  }
}
