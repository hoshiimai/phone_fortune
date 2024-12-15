enum RegisterPage {
  info,
  stripe,
  point;

  int getIndex() {
    switch(this) {
      case RegisterPage.info: {
        return 0;
      }
      case RegisterPage.stripe: {
        return 1;
      }
      case RegisterPage.point: {
        return 2;
      }
    }
  }

  static RegisterPage fromIndex(int index) {
    switch(index) {
      case 0: {
        return RegisterPage.info;
      }
      case 1: {
        return RegisterPage.stripe;
      }
      case 2: {
        return RegisterPage.point;
      }
      default: {
        return RegisterPage.info;
      }
    }
  }
}
