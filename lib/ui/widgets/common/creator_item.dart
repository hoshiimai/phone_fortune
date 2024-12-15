import 'package:callmobile/core/model/business/creator_status.dart';
import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_pages.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../app_image.dart';

class CreatorItem extends StatelessWidget {
  final Creator creator;

  const CreatorItem({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    Color borderStartColor, borderEndColor;
    Color buttonStartColor, buttonEndColor;

    switch (creator.status) {
      case CreatorStatus.away:
        {
          borderStartColor = AppColors.colorFFAD00;
          borderEndColor = AppColors.colorFFB397;
          buttonStartColor = AppColors.colorFD5C87;
          buttonEndColor = AppColors.colorFF393F;
          break;
        }
      case CreatorStatus.available:
        {
          borderStartColor = AppColors.color35D6C8;
          borderEndColor = AppColors.color47C66B;
          buttonStartColor = AppColors.color35D6C8;
          buttonEndColor = AppColors.color47C66B;
          break;
        }
      case CreatorStatus.offline:
        {
          borderStartColor = AppColors.colorC9C9C9;
          borderEndColor = AppColors.colorC9C9C9;
          buttonStartColor = AppColors.colorC9C9C9;
          buttonEndColor = AppColors.colorC9C9C9;
          break;
        }
    }
    return GestureDetector(
      onTap: () {
        if(creator.status == CreatorStatus.offline) {
          return;
        }
        Get.toNamed(AppPages.creatorProfile, arguments: {
          'creator': creator,
        });
      },
      child: Container(
        height: 56,
        padding: 1.paddingAll,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            gradient: AppColors.gradientCenterHorizontal(startColor: borderStartColor, endColor: borderEndColor)),
        child: Container(
          height: 54,
          padding: 6.paddingAll,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              const AppImage(
                image: AppAssets.bg_avatar_png,
                width: 44,
                height: 44,
                fit: BoxFit.cover,
                radius: 100,
              ),
              6.width,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '名前',
                    style: AppStyles.fontSize16(fontWeight: FontWeight.w600, color: AppColors.color020617),
                  ),
                  10.height,
                  Text(
                    'コメント',
                    style: AppStyles.fontSize10(color: AppColors.color64748B),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 42,
                padding: 24.paddingHorizontal,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    gradient: AppColors.gradientCenterHorizontal(startColor: buttonStartColor, endColor: buttonEndColor)),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: '通話中 ',
                      style: AppStyles.fontSize10(color: AppColors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${creator.waitingFanCount}人',
                            style: AppStyles.fontSize16(color: AppColors.white, fontWeight: FontWeight.w800)),
                        TextSpan(text: ' 持ち', style: AppStyles.fontSize10(color: AppColors.white)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
