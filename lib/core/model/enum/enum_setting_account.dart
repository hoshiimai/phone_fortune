import 'package:get/get.dart';
import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/utils/app_assets.dart';

enum SettingAccountType {
  idPassword,
  language,
  delete;

  String get nameLocalization {
    switch (this) {
      case SettingAccountType.idPassword:
        return LocaleKey.idPasswordTitle.tr;
      case SettingAccountType.language:
        return LocaleKey.languageTitle.tr;
      case SettingAccountType.delete:
        return LocaleKey.deleteAccountTitle.tr;
    }
  }

  String get icon {
    switch (this) {
      case SettingAccountType.idPassword:
        return AppAssets.ic_arrow_right_svg;
      case SettingAccountType.language:
        return AppAssets.ic_arrow_right_svg;
      case SettingAccountType.delete:
        return AppAssets.ic_arrow_right_svg;
    }
  }
}

enum SettingCreatorAccountType {
  idPassword,
  personalInfo,
  language,
  delete;

  String get nameLocalization {
    switch (this) {
      case SettingCreatorAccountType.idPassword:
        return LocaleKey.idPasswordTitle.tr;
      case SettingCreatorAccountType.personalInfo:
        return LocaleKey.personalInfo.tr;
      case SettingCreatorAccountType.language:
        return LocaleKey.languageTitle.tr;
      case SettingCreatorAccountType.delete:
        return LocaleKey.deleteAccountTitle.tr;
    }
  }
}
