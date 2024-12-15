class AppConstants {
  // Base name
  static const String appName = "2Shot";
  static const String appDatabaseName = "callmobile"; //no Space

  // Base url
  static const String apiProdUrl = "https://2shot.urani.tech";
  static const String apiDevUrl = "https://2shot.urani.tech";
  static const String apiLocalUrl = "https://2shot.urani.tech";

  // Link demo image when make UI
  // 150x150: width x height => we can change it.
  static const String demoImageUrl = "http://via.placeholder.com/150x150";

  static const String patternEmail =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //Deeplink
  static const iosStoreId = '0000000';

  /// Types
  static const String image = 'image';
  static const String video = 'video';

  static const String appStoreId = '';

  static const String termUrl = 'https://2shot.urani.tech/terms-user';
  static const String privacyUrl = 'https://2shot.urani.tech/privacy-policy';
  static const String commercialUrl = 'https://2shot.urani.tech/law';
  static const String faq = 'https://2shot.urani.tech/FAQ';

  static const String twitterApiKey = 'oj3YwqTqMNWzfeSwDbCxT37tT';
  static const String twitterApiSecretKey = 'InpzhXHxiFV9INx5mpFP9WoN7VIC6shLaUMgQ6uVZIfMLE6rri';
  static const String twitterRedirectURI = 'callmobile://';
}
