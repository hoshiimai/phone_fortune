import 'package:callmobile/ui/creator/home/binding/binding/creator_home_binding.dart';
import 'package:flutter/cupertino.dart';

import '../creator/home/creator_home_page.dart';
import 'app_router.dart';

class CreatorHomeRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    debugPrint('CreatorHomeRoutes ${routeSettings.name}');
    switch (routeSettings.name) {
      case '/':
        CreatorHomeBinding().dependencies();
        return CupertinoPageRoute(builder: (_) => const CreatorHomePage(), settings: routeSettings);

      default:
        return AppRouter.generateRoute(routeSettings);
    }
  }
}
