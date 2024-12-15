enum GenderType {
  male,
  female,
  other;

  String description() {
    switch (this) {
      //TODO: handle multi language
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
