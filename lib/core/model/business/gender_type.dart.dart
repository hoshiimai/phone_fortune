enum GenderType {
  male,
  female,
  other;

  int toInt() {
    switch (this) {
      case GenderType.male:
        {
          return 0;
        }
      case GenderType.female:
        {
          return 1;
        }
      case GenderType.other:
        {
          return 2;
        }
    }
  }

  static GenderType fromInt(int value) {
    switch (value) {
      case 0:
        {
          return GenderType.male;
        }
      case 1:
        {
          return GenderType.female;
        }
      case 2:
        {
          return GenderType.other;
        }
      default:
        return GenderType.other;
    }
  }

  String description() {
    switch (this) {
      case GenderType.male:
        {
          return '男性';
        }
      case GenderType.female:
        {
          return '女性';
        }
      case GenderType.other:
        {
          return '他の';
        }
    }
  }

  String shortDescription() {
    switch (this) {
      case GenderType.male:
        {
          return '男';
        }
      case GenderType.female:
        {
          return '女';
        }
      case GenderType.other:
        {
          return '他';
        }
    }
  }

  static GenderType fromDescription(String description) {
    if (description == '男性' || description == 'Male') {
      return GenderType.male;
    } else if (description == '女性' || description == 'Female') {
      return GenderType.female;
    } else {
      return GenderType.other;
    }
  }
}
