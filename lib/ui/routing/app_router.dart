import 'package:callmobile/ui/creator/profile/binding/binding/creator_profile_binding.dart';
import 'package:callmobile/ui/creator/profile/creator_profile_page.dart';
import 'package:flutter/cupertino.dart';

import '../../utils/app_pages.dart';
import '../common/update_info/binding/binding/info_binding.dart';
import '../common/update_info/email_edit_page.dart';
import '../common/update_info/email_verify_page.dart';
import '../common/update_info/info_view.dart';
import '../common/update_info/password_edit_page.dart';
import '../creator/personal_info_edit/binding/personal_info_edit_binding.dart';
import '../creator/personal_info_edit/personal_info_edit_page.dart';
import '../creator/profile_edit/binding/binding/creator_profile_edit_binding.dart';
import '../creator/profile_edit/creator_profile_edit_page.dart';
import '../fan/history_chat/binding/binding/history_chat_binding.dart';
import '../fan/history_chat/history_chat_page.dart';
import '../fan/profile/binding/binding/fan_profile_binding.dart';
import '../fan/profile/fan_profile_page.dart';
import '../fan/profile_edit/binding/binding/fan_profile_edit_binding.dart';
import '../fan/profile_edit/fan_profile_edit_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppPages.fanProfile:
        final info = (routeSettings.arguments as Map<String, dynamic>?)?['info'];

        FanProfileBinding().dependencies();
        return CupertinoPageRoute(
            builder: (_) => FanProfilePage(user: info), settings: routeSettings);
      case AppPages.fanProfileEdit:
        final info = (routeSettings.arguments as Map<String, dynamic>?)?['info'];

        FanProfileEditBinding().dependencies();
        return CupertinoPageRoute(
            builder: (_) => FanProfileEditPage(user: info), settings: routeSettings);
      case AppPages.historyChat:
        HistoryChatBinding().dependencies();
        return CupertinoPageRoute(
            builder: (_) => const HistoryChatPage(), settings: routeSettings);
      case AppPages.infoView:
        InfoBinding().dependencies();
        return CupertinoPageRoute(builder: (_) => const InfoView(), settings: routeSettings);
      case AppPages.emailEdit:
        return CupertinoPageRoute(builder: (_) => const EmailEditPage(), settings: routeSettings);
      case AppPages.emailVerify:
        return CupertinoPageRoute(builder: (_) => const EmailVerifyPage(), settings: routeSettings);
      case AppPages.passwordEdit:
        return CupertinoPageRoute(
            builder: (_) => const PasswordEditPage(), settings: routeSettings);
      case AppPages.creatorProfile:
        final info = (routeSettings.arguments as Map<String, dynamic>?)?['info'];
        CreatorProfileBinding().dependencies();
        return CupertinoPageRoute(
            builder: (_) => CreatorProfilePage(user: info), settings: routeSettings);
      case AppPages.creatorProfileEdit:
        CreatorProfileEditBinding().dependencies();
        return CupertinoPageRoute(
            builder: (_) => const CreatorProfileEditPage(), settings: routeSettings);
      case AppPages.personalInfoEdit:
        PersonalInfoEditBinding().dependencies();
        return CupertinoPageRoute(
            builder: (_) => const PersonalInfoEditPage(), settings: routeSettings);
      default:
        return _errorRoute(routeSettings);
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings routeSettings) {
    return CupertinoPageRoute<dynamic>(
      builder: (BuildContext context) => CupertinoPageScaffold(
        child: Center(
          child: Text('No route defined for ${routeSettings.name}'),
        ),
      ),
      settings: routeSettings,
    );
  }
}
