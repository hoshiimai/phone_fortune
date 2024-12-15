enum Role {
  fan,
  creator,
  agency,
  admin;

  int toInt() {
    switch (this) {
      case Role.fan:
        return 0;
      case Role.creator:
        return 1;
      case Role.agency:
        return 2;
      case Role.admin:
        return 3;
      default:
        return 0;
    }
  }

  static Role fromInt(int value) {
    switch (value) {
      case 0:
        return Role.fan;
      case 1:
        return Role.creator;
      case 2:
        return Role.agency;
      case 3:
        return Role.admin;
      default:
        return Role.fan;
    }
  }
}
