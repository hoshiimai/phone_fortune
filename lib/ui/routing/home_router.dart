import 'package:flutter/cupertino.dart';

import '../fan/home/binding/binding/home_binding.dart';
import '../fan/home/home_page.dart';
import 'app_router.dart';

class HomeRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    debugPrint('HomeRoutes ${routeSettings.name}');
    switch (routeSettings.name) {
      case '/':
        HomeBinding().dependencies();
        return CupertinoPageRoute(builder: (_) => const HomePage(), settings: routeSettings);

      default:
        return AppRouter.generateRoute(routeSettings);
    }
  }
}
