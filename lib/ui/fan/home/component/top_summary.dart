import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class TopSummary extends StatelessWidget {
  const TopSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.paddingAll,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.gradientTopSummary(), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topInfo(),
          Padding(
            padding: 16.paddingVertical,
            child: Row(
              children: [
                Expanded(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.ic_calendar_png, width: 32, height: 32,),
                    2.height,
                    Text('スケジュール', style: AppStyles.fontSize10(),)
                  ],
                )),
                Expanded(child: Container(
                  padding: 6.paddingVertical,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient:
                    AppColors.gradientSwitchSelected(),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.ic_coin_3d_png, width: 32, height: 32,),
                      2.height,
                      Text('ポイント購入', style: AppStyles.fontSize10(color: AppColors.white),)
                    ],
                  ),
                )),
                Expanded(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.ic_battery_png, width: 32, height: 32,),
                    2.height,
                    Text('体験レビュー', style: AppStyles.fontSize10(),)
                  ],
                ))
              ],
            ),
          ),
          Padding(
            padding: 10.paddingAll,
            child: Text('メールが届かない方へ', style: AppStyles.fontSize10(color: AppColors.color616161),),
          )
        ],
      ),
    );
  }

  Widget _topInfo() {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
          gradient:
              AppColors.gradientSwitchSelected(),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.ic_user_png,
            width: 32,
            height: 32,
          ),
          8.width,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '会員ID:********',
                style: AppStyles.fontSize12(color: AppColors.color616161),
              ),
              4.height,
              Text(
                'おにゃんこぽん様',
                style: AppStyles.fontSize16(color: AppColors.white, fontWeight: FontWeight.w600),
              )
            ],
          )),
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.ic_coin_png,
                      width: 20,
                      height: 20,
                    ),
                    6.width,
                    Text(
                      '300 Pt',
                      style: AppStyles.fontSize14(color: AppColors.colorFF7B98, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                4.height,
                Text('(うちサービス分 30Pt)', style: AppStyles.fontSize8(),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
