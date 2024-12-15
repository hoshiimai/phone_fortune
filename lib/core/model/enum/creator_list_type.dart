enum CreatorListType {
  managed,
  favorite,
  calling,
  potential;

  String getTypeString() {
    if (this == CreatorListType.managed) {
      return 'managed';
    } else if (this == CreatorListType.favorite) {
      return 'liked';
    } else if (this == CreatorListType.calling) {
      return 'calling';
    } else {
      return 'potential';
    }
  }
}
