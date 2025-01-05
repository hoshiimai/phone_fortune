import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';

class AppDimensions {
  static double bottomHeight = 63 + Get.mediaQuery.padding.bottom;

  /// Use for padding
  static const double top = 16;
  static const double marginLeft = 16;
  static const double marginRight = 16;
  static const EdgeInsets sideMargins = EdgeInsets.symmetric(horizontal: 16);
  static EdgeInsets paddingTop =
      (kToolbarHeight + Get.mediaQuery.padding.top + 10).toInt().paddingTop;
  static const EdgeInsets allMargins = EdgeInsets.all(16);
  static BoxDecoration decoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: 30.borderRadiusTop,
  );
}
