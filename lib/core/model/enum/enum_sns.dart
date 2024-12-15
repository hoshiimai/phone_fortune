enum Sns {
  google,
  facebook,
  apple,
  x;

  int toInt() {
    switch (this) {
      case Sns.x:
        return 0;
      case Sns.google:
        return 1;
      case Sns.facebook:
        return 2;
      case Sns.apple:
        return 3;
    }
  }
}
