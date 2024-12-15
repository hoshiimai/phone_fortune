import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../locale/locale_key.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';

enum TypeCall {
  available,
  calling,
  finished,
  cancel;

  static TypeCall getTypeCall({required creatorRoomLength}) {
    switch (creatorRoomLength) {
      case 0:
        {
          return TypeCall.available;
        }
      default:
        {
          return TypeCall.calling;
        }
    }
  }

  String get text {
    switch (this) {
      case TypeCall.available:
        return LocaleKey.callNew.tr;
      case TypeCall.calling:
        return LocaleKey.callCalling.tr;
      case TypeCall.finished:
        return '';
      case TypeCall.cancel:
        return '';
    }
  }

  LinearGradient? get gradientColor {
    switch (this) {
      case TypeCall.available:
        return AppColors.gradient();
      case TypeCall.calling:
        return AppColors.gradientCalling();
      case TypeCall.finished:
        return null;
      case TypeCall.cancel:
        return null;
    }
  }

  static TypeCall fromInt(int status) {
    switch (status) {
      case 0:
        {
          return TypeCall.available;
        }
      case 1:
        {
          return TypeCall.calling;
        }
      case 2:
        {
          return TypeCall.finished;
        }
      case 3:
        {
          return TypeCall.cancel;
        }
      default:
        {
          return TypeCall.available;
        }
    }
  }

  String get icon {
    switch (this) {
      case TypeCall.available:
        return AppAssets.ic_call_new_svg;
      case TypeCall.calling:
        return AppAssets.ic_call_calling_svg;
      case TypeCall.finished:
        return AppAssets.ic_call_finish_svg;
      case TypeCall.cancel:
        return AppAssets.ic_call_cancel_svg;
    }
  }
}
