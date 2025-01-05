enum Status {
  online,
  away,
  offline;

  int toInt() {
    switch (this) {
      case Status.online:
        {
          return 0;
        }
      case Status.offline:
        {
          return 1;
        }
      case Status.away:
        {
          return 2;
        }
    }
  }

  static Status fromInt(int? status) {
    switch(status) {
      case 0: {
        return Status.online;
      }
      case 1: {
       return Status.offline;
      }
      case 2: {
        return Status.away;
      }
      default: {
        return Status.offline;
      }
    }
  }

  String description() {
    switch (this) {
      case Status.online:
        {
          return '滞在';
        }
      case Status.away:
        {
          return '離席';
        }
      case Status.offline:
        {
          return '本日不在';
        }
    }
  }

  static Status fromDescription(String description) {
    if (description == '滞在') {
      return Status.online;
    } else if (description == '離席') {
      return Status.away;
    } else {
      return Status.offline;
    }
  }
}
