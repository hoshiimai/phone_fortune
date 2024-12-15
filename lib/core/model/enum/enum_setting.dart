import 'package:get/get.dart';
import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/utils/app_assets.dart';

enum SettingType {
  history,
  settingAccount,
  personalInfo,
  logout;

  String get nameLocalization {
    switch (this) {
      case SettingType.history:
        return LocaleKey.historyChat.tr;
      case SettingType.settingAccount:
        return LocaleKey.settingAccount.tr;
      case SettingType.personalInfo:
        return LocaleKey.personalInfo.tr;
      case SettingType.logout:
        return LocaleKey.logout.tr;
    }
  }

  String get icon {
    switch (this) {
      case SettingType.history:
      case SettingType.settingAccount:
      case SettingType.personalInfo:
        return AppAssets.ic_arrow_right_svg;
      case SettingType.logout:
        return AppAssets.ic_logout_svg;
    }
  }
}
