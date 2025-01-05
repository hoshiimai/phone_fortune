import 'package:get/get.dart';

import 'package:callmobile/utils/app_assets.dart';

enum SettingType {
  history,
  settingAccount,
  personalInfo,
  logout;

  String get nameLocalization {
    switch (this) {
      case SettingType.history:
        return '会話履歴';
      case SettingType.settingAccount:
        return 'アカウント設定';
      case SettingType.personalInfo:
        return '本人情報';
      case SettingType.logout:
        return 'ログアウト';
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
