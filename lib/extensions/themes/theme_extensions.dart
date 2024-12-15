import 'package:flutter/material.dart';
import 'package:callmobile/extensions/themes/app_color_theme.dart';

extension ThemeExtensions on BuildContext {
  AppColorTheme get appColorTheme => Theme.of(this).extension<AppColorTheme>()!;
}
