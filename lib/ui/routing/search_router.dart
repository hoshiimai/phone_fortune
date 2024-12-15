import 'package:flutter/cupertino.dart';

import '../fan/search/binding/binding/search_binding.dart';
import '../fan/search/search_page.dart';
import 'app_router.dart';

class SearchRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    debugPrint('SearchRoutes ${routeSettings.name}');
    switch (routeSettings.name) {
      case '/':
        SearchBinding().dependencies();
        return CupertinoPageRoute(builder: (_) => const SearchPage(), settings: routeSettings);

      default:
        return AppRouter.generateRoute(routeSettings);
    }
  }
}
