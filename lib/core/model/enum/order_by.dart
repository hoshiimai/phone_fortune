enum OrderBy {
  star,
  favorite,
  point;

  int toInt() {
    if (this == OrderBy.star) {
      return 0;
    } else if (this == OrderBy.favorite) {
      return 1;
    } else {
      return 2;
    }
  }

}
