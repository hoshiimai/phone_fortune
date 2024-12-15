import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController? controller;
  final Color? color;
  final Color? textColor;
  final Function(String?) onChanged;

  const OtpInput({
    super.key,
    this.controller,
    required this.onChanged,
    this.color = AppColors.colorBCBDCB,
    this.textColor = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      autoDisposeControllers: controller == null,
      controller: controller,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      appContext: context,
      errorTextSpace: 0,
      length: 4,
      textStyle: AppStyles.fontSize24(color: textColor!),
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        fieldOuterPadding: EdgeInsets.zero,
        borderWidth: 1,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(20),
        fieldHeight: 95,
        fieldWidth: (Get.width - 100) / 4,
        activeFillColor: AppColors.transparent,
        activeColor: AppColors.primary,
        selectedFillColor: AppColors.transparent,
        selectedColor: AppColors.primary,
        disabledColor: AppColors.transparent,
        inactiveFillColor: AppColors.transparent,
        inactiveColor: color,
      ),
      cursorColor: textColor,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      beforeTextPaste: (_) => false,
    );
  }
}
