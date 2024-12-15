import 'package:get/get.dart';
import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/utils/app_assets.dart';

final creatorPages = [
  BottomNavigationPage.home, BottomNavigationPage.waiting, BottomNavigationPage.setting,
];

final fanPages = [
  BottomNavigationPage.home, BottomNavigationPage.search, BottomNavigationPage.setting,
];


enum BottomNavigationPage {
  home,
  search,
  waiting,
  setting;

  String get nameTab {
    switch (this) {
      case BottomNavigationPage.home:
        return LocaleKey.home.tr;
      case BottomNavigationPage.search:
        return LocaleKey.search.tr;
      case BottomNavigationPage.setting:
        return LocaleKey.setting.tr;
      case BottomNavigationPage.waiting:
        return '順番待ちリスト';
    }
  }

  String get activeIcon {
    switch (this) {
      case BottomNavigationPage.home:
        return AppAssets.ic_home_svg;
      case BottomNavigationPage.search:
        return AppAssets.ic_search_svg;
      case BottomNavigationPage.setting:
        return AppAssets.ic_setting_svg;
      case BottomNavigationPage.waiting:
        return AppAssets.ic_waiting_menu_svg;
    }
  }
}