import 'package:callmobile/ui/creator/waiting/binding/binding/waiting_binding.dart';
import 'package:callmobile/ui/creator/waiting/waiting_page.dart';
import 'package:flutter/cupertino.dart';
import 'app_router.dart';

class WaitingRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    debugPrint('WaitingRoutes ${routeSettings.name}');
    switch (routeSettings.name) {
      case '/':
        WaitingBinding().dependencies();
        return CupertinoPageRoute(builder: (_) => const WaitingPage(), settings: routeSettings);

      default:
        return AppRouter.generateRoute(routeSettings);
    }
  }
}
