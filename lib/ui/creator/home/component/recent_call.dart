import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_button.dart';
import 'package:callmobile/ui/widgets/app_image.dart';
import 'package:callmobile/ui/widgets/common/fan_waiting_item.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/response/model/user.dart';
import '../../../../utils/app_colors.dart';
class RecentCall extends StatelessWidget {
  final int callDurationInSec;
  final User fan;

  const RecentCall({
    super.key,
    required this.fan,
    required this.callDurationInSec,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.paddingAll.copyWith(bottom: 12),
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                AppAssets.ic_call_list_png,
                width: 20,
                height: 20,
              ),
              10.width,
              Container(
                decoration:
                    BoxDecoration(gradient: AppColors.gradientSwitchSelected(), borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                child: Text(
                  '通話中ユーザー情報',
                  style: AppStyles.fontSize14(color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          Container(
            margin: 10.paddingVertical,
            decoration: BoxDecoration(
              gradient: AppColors.gradientSwitchSelected(),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: 1.paddingAll,
              padding: 10.paddingAll,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: 8.paddingRight,
                    child: AppImage(
                      image: fan.getAvatarPath(),
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                      radius: 100,
                    ),
                  ),
                  Text(
                    fan.fullName ?? '',
                    style: AppStyles.fontSize14(
                        color: AppColors.color020617, fontWeight: FontWeight.w600, height: 21 / 14),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          FanWaitingItem(
            index: 1,
            fan: fan,
            isShow: true,
            callDurationInSec: callDurationInSec,
          ),
          10.height,
          Stack(
            children: [
              AppButton(
                title: 'さらに履歴を表示する',
                borderRadius: BorderRadius.circular(8),
                onTap: () {},
              ),
              const Positioned(right: 16, bottom: 0, top: 0, child: AppImage(image: AppAssets.ic_right_double_svg))
            ],
          )
        ],
      ),
    );
  }
}
