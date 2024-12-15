import 'package:flutter/cupertino.dart';

import '../common/setting/binding/binding/setting_binding.dart';
import '../common/setting/setting_page.dart';
import 'app_router.dart';

class SettingRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    debugPrint('SettingRoutes ${routeSettings.name}');
    switch (routeSettings.name) {
      case '/':
        SettingBinding().dependencies();
        return CupertinoPageRoute(builder: (_) => const SettingPage(), settings: routeSettings);

      default:
        return AppRouter.generateRoute(routeSettings);
    }
  }
}
