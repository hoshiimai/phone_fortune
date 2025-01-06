import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class TopGuideline extends StatelessWidget {
  const TopGuideline({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.paddingAll,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                AppAssets.ic_book_png,
                width: 20,
                height: 20,
              ),
              10.width,
              Container(
                decoration:
                    BoxDecoration(gradient: AppColors.gradientSwitchSelected(), borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                child: Text(
                  'ご利用ガイド',
                  style: AppStyles.fontSize14(color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          10.height,
          Row(
            children: [
              Image.asset(
                AppAssets.ic_target_png,
                width: 16,
                height: 16,
              ),
              4.width,
              Text(
                '使用説明書01: 説明する説明する説明する説',
                style: AppStyles.fontSize12(color: AppColors.color616161, fontWeight: FontWeight.w500),
              )
            ],
          ),
          10.height,
          Padding(
            padding: 3.paddingVertical,
            child: Image.asset(
              AppAssets.ic_arrow_down_png,
              width: 9,
              height: 9,
            ),
          ),
        ],
      ),
    );
  }
}
