int N = 4;
List<int> arr = [];
List puzzle = [];

int getInvCount(List arr) {
  int inv_count = 0;
  for (int i = 0; i < N * N - 1; i++) {
    for (int j = i + 1; j < N * N; j++) {
// count pairs(arr[i], arr[j]) such that
// i < j but arr[i] > arr[j]
      if (arr[j] && arr[i] && arr[i] > arr[j]) inv_count++;
    }
  }
  return inv_count;
}

// finding blank position
findBlankPosition(puzzle) {
// start from bottom-right corner of matrix
  for (int i = N - 1; i >= 0; i--) {
    for (int j = N - 1; j >= 0; j--) {
      if (puzzle[i][j] == 0) {
        return N - i;
      }
    }
  }
}
