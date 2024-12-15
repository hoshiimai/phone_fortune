import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/ui/widgets/base/dialog/dialog_confirm.dart';
import 'package:callmobile/ui/widgets/base/dialog/dialog_error.dart';
import 'package:callmobile/utils/app_pages.dart';
import 'package:callmobile/utils/app_shared.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../fan/call/binding/binding/call_binding.dart';
import '../app_button.dart';
import 'dialog/dialog_success.dart';

Future<dynamic> showDialogErrorToken() {
  if (Get.isDialogOpen == true) return Future.value();
  return Get.dialog(
    DialogConfirm(
      message: LocaleKey.loginSessionExpires,
      onClickConfirm: () async {
        await Get.find<AppShared>().clear();
        await Get.offNamedUntil(
          AppPages.splash,
          (route) => false,
        );
      },
    ),
    barrierDismissible: false,
  );
}

Future<void> showErrorDialog(String message) {
  if (message.isEmpty) return Future.value();
  if (Get.isDialogOpen == true) return Future.value();
  return Get.dialog(
    DialogError(message: message),
    barrierDismissible: false,
  );
}

Future<void> showConfirmDialog({
  String? title,
  required String message,
  String? textConfirm,
  final VoidCallback? onClickConfirm,
  final VoidCallback? onClickCancel,
}) {
  if (message.isEmpty) return Future.value();
  if (Get.isDialogOpen == true) return Future.value();
  return Get.dialog(
    DialogConfirm(
      title: title,
      message: message,
      textConfirm: textConfirm,
      onClickConfirm: onClickConfirm,
      onClickCancel: onClickCancel,
    ),
    barrierDismissible: false,
  );
}

Future<void> showSuccessDialog(
    {String? title,
      required String message,
      String? textConfirm,
      final void Function()? onConfirmPressed}) {
  if (message.isEmpty) return Future.value();
  if (Get.isDialogOpen == true) return Future.value();
  return Get.dialog(
    DialogSuccess(
      title: title,
      message: message,
      textConfirm: textConfirm,
      onConfirmPressed: onConfirmPressed,
    ),
    barrierDismissible: false,
  );
}

void showUpdateSuccessDialog(BuildContext context, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: AlertDialog(
            insetPadding: AppDimensions.allMargins,
            backgroundColor: AppColors.white,
            content: SizedBox(
              width: Get.width,
              height: 164,
              child: Column(
                children: [
                  31.height,
                  SvgPicture.asset(
                    AppAssets.ic_success_svg,
                    height: 60,
                    width: 60,
                  ),
                  14.height,
                  Text(
                    message,
                    style: AppStyles.fontSize16(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      height: 24 / 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

void showWaitingDialog(BuildContext context, Creator creator) {
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: AlertDialog(
            insetPadding: AppDimensions.allMargins,
            backgroundColor: AppColors.white,
            content: SizedBox(
              width: Get.width,
              height: 280,
              child: Column(
                children: [
                  31.height,
                  Text(
                    '確認',
                    style: AppStyles.fontSize16(
                      fontWeight: FontWeight.w600,
                      color: AppColors.colorFF7B98,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.height,
                  Text(
                    '並んで待ってもよろしいですか?',
                    style: AppStyles.fontSize14(
                      color: AppColors.color020617,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  10.height,
                  Image.asset(
                    AppAssets.ic_waiting_png,
                    width: 40,
                    height: 40,
                  ),
                  10.height,
                  Text(
                    'あなたの前にいる人の数:',
                    style: AppStyles.fontSize14(
                      color: AppColors.color020617,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  10.height,
                  Text(
                    '${creator.waitingFanCount}',
                    style: AppStyles.fontSize20(
                      fontWeight: FontWeight.w600,
                      color: AppColors.colorFFAD00,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.height,
                  LayoutBuilder(builder: (ctx, boxConstraint) {
                    final width = (boxConstraint.maxWidth - 14) / 2;
                    return Row(
                      children: [
                        AppButton(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.of(context).pop();
                          },
                          width: width,
                          height: 55,
                          title: '順番待ち',
                          gradient: AppColors.gradientCenterHorizontal(
                              startColor: AppColors.colorFD5C87, endColor: AppColors.colorFF393F),
                        ),
                        14.width,
                        AppButton(
                          onTap: () => Navigator.of(context).pop(),
                          backgroundColor: AppColors.color9B9B9B,
                          width: width,
                          height: 55,
                          title: 'キャンセル',
                        )
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      });
}

void showConfirmCallDialog(BuildContext context, Creator creator) {
  showDialog(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: AlertDialog(
            insetPadding: AppDimensions.allMargins,
            backgroundColor: AppColors.white,
            content: SizedBox(
              width: Get.width,
              height: 280,
              child: Column(
                children: [
                  31.height,
                  Text(
                    '確認',
                    style: AppStyles.fontSize16(
                      fontWeight: FontWeight.w600,
                      color: AppColors.colorFF7B98,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.height,
                  Text(
                    'ナナコさんへ電話をかけます。',
                    style: AppStyles.fontSize14(
                      color: AppColors.color020617,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  10.height,
                  Image.asset(
                    AppAssets.bg_avatar_png,
                    width: 80,
                    height: 80,
                  ),
                  10.height,
                  Text(
                    'よろしいですか？',
                    style: AppStyles.fontSize14(
                      color: AppColors.color020617,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.height,
                  LayoutBuilder(builder: (ctx, boxConstraint) {
                    final width = (boxConstraint.maxWidth - 14) / 2;
                    return Row(
                      children: [
                        AppButton(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.of(context).pop();
                            CallBinding().dependencies();
                            Get.toNamed(AppPages.call,
                                arguments: {'user': null, 'isCaller': true});
                          },
                          width: width,
                          height: 55,
                          title: '電話する',
                          gradient: AppColors.gradientCenterHorizontal(
                              startColor: AppColors.color35D6C8, endColor: AppColors.color47C66B),
                        ),
                        14.width,
                        AppButton(
                          onTap: () => Navigator.of(context).pop(),
                          backgroundColor: AppColors.color9B9B9B,
                          width: width,
                          height: 55,
                          title: 'キャンセル',
                        )
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      });
}
