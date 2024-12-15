import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_image.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class ScheduleSetting extends StatelessWidget {
  const ScheduleSetting({super.key});

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
                AppAssets.ic_schedule_png,
                width: 20,
                height: 20,
              ),
              10.width,
              Container(
                decoration:
                    BoxDecoration(gradient: AppColors.gradientSwitchSelected(), borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                child: Text(
                  '待機予定時間設定',
                  style: AppStyles.fontSize14(color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          10.height,
          setting('設定1', '11/20', '00:00 ~ 12:00'),
          Container(
            color: AppColors.colorD7E2FE,
            height: 0.5,
          ),
          setting('設定2', '11/20', '00:00 ~ 12:00'),
          Container(
            color: AppColors.colorD7E2FE,
            height: 0.5,
          ),
          setting('設定3', '-', '~'),
          Container(
            color: AppColors.colorD7E2FE,
            height: 0.5,
          ),
          10.height,
          Text('※時間帯3つまで指定可能です', style: AppStyles.fontSize10(color: AppColors.colorFC85A0, height: 2),)
        ],
      ),
    );
  }

  Widget setting(String title, String date, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Row(
        children: [
          Text(
            title,
            style: AppStyles.fontSize12(color: AppColors.colorFF7B98),
          ),
          const Expanded(flex: 3, child: SizedBox.shrink()),
          Expanded(flex: 4, child: Text(date, textAlign: TextAlign.center,)),
          10.width,
          Text('(水)'),
          10.width,
          Expanded(flex: 8, child: Text(time,textAlign: TextAlign.center,)),
          const Expanded(flex: 2, child: SizedBox.shrink()),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                gradient: AppColors.gradientCenterHorizontal(
                    startColor: AppColors.color2C374E.withOpacity(0.7),
                    endColor: AppColors.color2C374E.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(10)),
            child: const AppImage(
              image: AppAssets.ic_setting_png,
            ),
          )
        ],
      ),
    );
  }
}
