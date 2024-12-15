import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/model/response/model/user.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_pages.dart';
import '../../../../utils/app_styles.dart';
import '../../../widgets/app_image.dart';

class UserInfo extends StatelessWidget {
  final User? user;
  const UserInfo({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final imagePath = user?.getAvatarPath() ?? '';
    return InkWell(
      onTap: () {
        if(user?.role == Role.fan) {
          Navigator.of(context).pushNamed(AppPages.fanProfile);
        } else {
          Navigator.of(context).pushNamed(AppPages.creatorProfile);
        }
      },
      child: Card(
        color: AppColors.white,
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.black.withOpacity(0.5),
        margin: 0.paddingAll,
        shape: RoundedRectangleBorder(
          borderRadius: 30.borderRadiusAll,
        ),
        elevation: 4,
        child: Container(
          height: 100,
          padding: AppDimensions.sideMargins,
          child: Row(
            children: [
              AppImage(
                image: imagePath,
                width: 50,
                height: 50,
                radius: 100,
              ),
              20.width,
              Text(
                user?.nickname ?? '',
                style: AppStyles.fontSize14(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(AppAssets.ic_arrow_right_svg)
            ],
          ),
        ),
      ),
    );
  }
}
