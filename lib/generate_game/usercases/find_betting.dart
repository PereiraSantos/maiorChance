class FindBetting {
  find(List<int> list, int value) {
    int low = 0;
    int high = list.length - 1;

    while (low <= high) {
      int middle = (low + high) ~/ 2;
      int kick = list[middle.toInt()];

      if (kick == value) return middle;
      if (kick > value) {
        high = middle - 1;
      } else {
        low = middle + 1;
      }
    }

    return null;
  }
}
