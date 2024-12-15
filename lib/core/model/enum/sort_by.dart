enum SortBy {
  desc,
  asc;

  int toInt() {
    if (this == SortBy.desc) {
      return 0;
    } else {
      return 1;
    }
  }
}
