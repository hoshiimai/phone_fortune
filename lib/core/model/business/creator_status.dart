enum CreatorStatus {
  available,
  away,
  offline;

  String description() {
    switch (this) {
      case CreatorStatus.available:
        {
          return '滞在';
        }
      case CreatorStatus.away:
        {
          return '離席';
        }
      case CreatorStatus.offline:
        {
          return '本日不在';
        }
    }
  }

  static CreatorStatus fromDescription(String description) {
    if (description == '滞在') {
      return CreatorStatus.available;
    } else if (description == '離席') {
      return CreatorStatus.away;
    } else {
      return CreatorStatus.offline;
    }
  }
}
