import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKey.noData.tr,
        style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.black),
      ),
    );
  }
}