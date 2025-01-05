import 'package:callmobile/core/model/business/creator_status.dart';
import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_pages.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../app_image.dart';

class CreatorItem extends StatelessWidget {
  final User creator;

  const CreatorItem({super.key, required this.creator});

  @override
  Widget build(BuildContext context) {
    Color borderStartColor, borderEndColor;
    Color buttonStartColor, buttonEndColor;
    int waitingCount = creator.waitingCount ?? 0;
    if(waitingCount == 0 && creator.isCalling) {
      waitingCount = 1;
    }
    if (waitingCount > 0) {
      buttonStartColor = AppColors.colorFD5C87;
      buttonEndColor = AppColors.colorFF393F;
    } else if (waitingCount == 0) {
      buttonStartColor = AppColors.color35D6C8;
      buttonEndColor = AppColors.color47C66B;
    } else {
      buttonStartColor = AppColors.colorC9C9C9;
      buttonEndColor = AppColors.colorC9C9C9;
    }
    switch (creator.status!) {
      case Status.away:
        {
          borderStartColor = AppColors.colorFFAD00;
          borderEndColor = AppColors.colorFFB397;
          buttonStartColor = AppColors.colorC9C9C9;
          buttonEndColor = AppColors.colorC9C9C9;
          break;
        }
      case Status.online:
        {
          borderStartColor = AppColors.color35D6C8;
          borderEndColor = AppColors.color47C66B;
          break;
        }
      case Status.offline:
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
        if(creator.status != Status.online) {
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
              AppImage(
                image: creator.getAvatarPath(),
                width: 44,
                height: 44,
                fit: BoxFit.cover,
                radius: 100,
              ),
              6.width,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      creator.fullName ?? '',
                      style: AppStyles.fontSize16(fontWeight: FontWeight.w600, color: AppColors.color020617),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    10.height,
                    Text(
                      creator.welcomeMessages ?? '',
                      style: AppStyles.fontSize10(color: AppColors.color64748B),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Container(
                height: 42,
                padding: 24.paddingHorizontal,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    gradient: AppColors.gradientCenterHorizontal(startColor: buttonStartColor, endColor: buttonEndColor)),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      style: AppStyles.fontSize10(color: AppColors.white),
                      children: <TextSpan>[
                        TextSpan(
                            text: '$waitingCount人',
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
