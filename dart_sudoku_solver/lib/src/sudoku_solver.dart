import 'sudoku_helper.dart';

class SudokuSolver {
  List<int> board;

  SudokuSolver(List<int?> initialBoard)
      : board = makeListNonNullableAndReplaceNullsWithZero(initialBoard);

  bool isValid(int pos, int num) {
    int row = pos ~/ 9;
    int col = pos % 9;

    // Check if the number can be placed in the given row and column
    for (int i = 0; i < 9; i++) {
      if (board[row * 9 + i] == num || board[i * 9 + col] == num) {
        return false;
      }
    }

    // Check the 3x3 subgrid
    int startRow = 3 * (row ~/ 3);
    int startCol = 3 * (col ~/ 3);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[(startRow + i) * 9 + startCol + j] == num) {
          return false;
        }
      }
    }

    return true;
  }

  bool solveSudoku() {
    int emptyCell;
    try {
      emptyCell = board.indexWhere((element) => element == 0);
    } catch (e) {
      return true;
    }

    if (emptyCell == -1) {
      return true;
    }

    for (int num = 1; num <= 9; num++) {
      if (isValid(emptyCell, num)) {
        board[emptyCell] = num;
        if (solveSudoku()) {
          return true;
        }
        board[emptyCell] = 0; // Backtrack
      }
    }
    return false;
  }

  List<int> solve() {
    List<int> originalBoard = List.from(board);
    if (solveSudoku()) {
      return board;
    }
    return originalBoard;
  }
}
