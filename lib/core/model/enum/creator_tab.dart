enum CreatorTab {
  byStar,
  byFavorite,
  byPoint;

  int getIndex() {
    switch(this) {
      case CreatorTab.byStar: {
        return 0;
      }
      case CreatorTab.byFavorite: {
        return 1;
      }
      case CreatorTab.byPoint: {
        return 2;
      }
    }
  }
}
