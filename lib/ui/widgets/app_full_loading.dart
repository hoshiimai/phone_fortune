import 'package:callmobile/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppFullLoading extends StatelessWidget {
  const AppFullLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.black45,
      child: Center(
        child: LoadingAnimationWidget.progressiveDots(
          color: AppColors.primary,
          size: 50,
        ),
      ),
    );
  }
}
