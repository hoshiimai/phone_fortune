import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_button.dart';
import 'package:callmobile/ui/widgets/app_image.dart';
import 'package:callmobile/ui/widgets/common/fan_waiting_item.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/model/business/fan_waiting_info.dart';
import '../../../../utils/app_colors.dart';

class WaitingSection extends StatelessWidget {
  final List<FanWaitingInfo> infos;

  const WaitingSection({super.key, required this.infos,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 24.paddingBottom,
      padding: 8.paddingAll.copyWith(bottom: 0),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppAssets.ic_waiting_menu_svg,
                width: 20,
                height: 20,
              ),
              10.width,
              Container(
                decoration:
                BoxDecoration(gradient: AppColors.gradientSwitchSelected(), borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                child: Text(
                  '待機中ユーザー情報',
                  style: AppStyles.fontSize14(color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          10.height,
          ...infos.asMap().entries.map<Widget>((entry) {
            int index = entry.key;
            var info = entry.value;
            return FanWaitingItem(
              index: index+1, info: info, isShow: index == 1, );
          })
        ],
      ),
    );
  }
}
