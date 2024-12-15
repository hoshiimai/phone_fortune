import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/ui/widgets/app_button.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_dimensions.dart';
import 'package:callmobile/utils/app_styles.dart';

class DialogConfirm extends StatelessWidget {
  final String? title;
  final String message;
  final String? textConfirm;
  final String? textCancel;
  final void Function()? onClickConfirm;
  final void Function()? onClickCancel;
  const DialogConfirm(
      {super.key,
      this.title,
      required this.message,
      this.textConfirm,
      this.textCancel,
      this.onClickCancel,
      this.onClickConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: AppDimensions.allMargins,
      backgroundColor: AppColors.white,
      title: title != null
          ? Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 10),
              child: Text(
                title!,
                style: AppStyles.fontSize16(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  height: 24 / 16,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : null,
      content: SizedBox(
        width: Get.width,
        child: Text(
          message,
          style: AppStyles.fontSize14(color: AppColors.black, height: 21 / 14),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              width: Get.width / 3,
              onTap: onClickConfirm ?? () => Get.back(),
              title: textConfirm ?? LocaleKey.call.tr,
              height: 48,
              padding: 0.paddingAll,
            ),
            10.width,
            AppButton(
              width: Get.width / 3,
              onTap: onClickCancel ?? () => Get.back(),
              backgroundColor: AppColors.black,
              title: textCancel ?? LocaleKey.cancel.tr,
              height: 48,
              padding: 0.paddingAll,
            ),
          ],
        ),
      ],
    );
  }
}
