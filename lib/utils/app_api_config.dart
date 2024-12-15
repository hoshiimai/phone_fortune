import 'package:flutter/cupertino.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:callmobile/utils/app_constants.dart';

enum Flavor { dev, prod, local }

class AppApiConfig {
  /// this is if flavor has been initialized by calling init()
  static bool _initialized = false;

  static late final Flavor _flavor;

  /// The flavor pulled from the package name.
  /// NOTE: Environment().init() MUST be called before flavor is available!
  static Flavor get flavor {
    if (!_initialized) {
      throw 'Environment has not been initialized!  '
          'Please call Environment.init() before using '
          'flavor or any other variables requiring flavor';
    }
    return _flavor;
  }

  /// Initializes the flavor from either the debug value or the package name
  Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();

    if (packageInfo.packageName == "com.callmobile.callmobile") {
      debugPrint('Dev Environment');
      _flavor = Flavor.dev;
    } else {
      _flavor = Flavor.dev;
    }

    _initialized = true;
  }

  static String get baseApiUrl => '$apiUrl/';

  static String get apiUrl {
    switch (flavor) {
      case Flavor.prod:
        return AppConstants.apiProdUrl;
      case Flavor.dev:
        return AppConstants.apiDevUrl;
      case Flavor.local:
        return AppConstants.apiLocalUrl;
    }
  }
}
