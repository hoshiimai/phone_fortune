import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/business/creator_status.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/app_radio_button_group.dart';

class StatusSetting extends StatelessWidget {
  final CreatorStatus status;
  final Function(CreatorStatus) onUpdateStatus;
  const StatusSetting({super.key, required this.status, required this.onUpdateStatus,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.paddingAll,
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.gradientTopSummary(), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 62,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                gradient:
                AppColors.gradientSwitchSelected(),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.ic_star_png,
                  width: 32,
                  height: 32,
                ),
                8.width,
                Expanded(
                    child: Text(
                      'コンデ・コマさん',
                      style: AppStyles.fontSize16(color: AppColors.white, fontWeight: FontWeight.w600),
                    )),
              ],
            ),
          ),
          36.height,
          // Status setting
          AppRadioButtonGroup(
            direction: Axis.vertical,
            gradient: AppColors.gradientCenterHorizontal(startColor:AppColors.color35D6C8, endColor: AppColors.color47C66B),
            secondaryGradient: AppColors.gradientCenterHorizontal(startColor:AppColors.colorFD5C87, endColor: AppColors.colorFF393F),
            height: 62,
            options: const [
              '滞在',
              '離席',
              '本日不在'
            ],
            selectedOption: status.description(),
            onChanged: (String? value) {
              if (value?.isNotEmpty ?? false) {
                final status = CreatorStatus.fromDescription(value!);
                onUpdateStatus.call(status);
              }
            },
          ),
          8.height,
          Text('※15分放置で自動履歴となります。', style: AppStyles.fontSize10(color: AppColors.colorFC85A0, height: 2),)
        ],
      ),
    );
  }
}
