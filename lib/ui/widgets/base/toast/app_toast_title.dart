import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:callmobile/utils/app_colors.dart';

import '../../../../core/model/enum/toast_type.dart';

class AppToastTitle extends StatelessWidget {
  final ToastType toastType;

  const AppToastTitle({super.key, required this.toastType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          toastType.title,
          LinearPercentIndicator(
            width: Get.width * .32,
            lineHeight: 4,
            percent: 1.0,
            backgroundColor: AppColors.primary.withOpacity(.1),
            progressColor: AppColors.primary,
            animation: true,
            animationDuration: 3000,
            barRadius: const Radius.circular(2),
            padding: const EdgeInsets.only(right: 6),
          ),
        ],
      ),
    );
  }
}
