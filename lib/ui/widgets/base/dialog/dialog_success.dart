import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';

import 'package:callmobile/ui/widgets/app_button.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_dimensions.dart';
import 'package:callmobile/utils/app_styles.dart';

class DialogSuccess extends StatelessWidget {
  final String? title;
  final String message;
  final String? textConfirm;
  final void Function()? onConfirmPressed;

  const DialogSuccess({
    super.key,
    this.title,
    required this.message,
    this.textConfirm,
    this.onConfirmPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: AppDimensions.allMargins,
      backgroundColor: AppColors.white,
      title: title != null
          ? Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                title!,
                style: AppStyles.fontSize16(
                  fontFamily: AppStyles.fontHiraginoKakuProW6,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : null,
      content: SizedBox(
        width: Get.width,
        child: Text(
          message,
          style: AppStyles.fontSize14(color: AppColors.black),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Padding(
          padding: 40.paddingHorizontal.copyWith(top: 10, bottom: 20),
          child: AppButton(
              onTap: () {
                onConfirmPressed?.call();
              },
              title: textConfirm ?? 'OK',
              height: 56),
        ),
      ],
    );
  }
}
