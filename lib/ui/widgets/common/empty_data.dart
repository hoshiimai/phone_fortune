import 'package:flutter/material.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'データなし',
        style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.black),
      ),
    );
  }
}
