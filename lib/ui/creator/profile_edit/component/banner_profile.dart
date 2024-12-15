import 'dart:io';

import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/managers/permission_manager.dart';
import '../../../../locale/locale_key.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../widgets/app_border_split.dart';
import '../../../widgets/app_image.dart';
import '../interactor/creator_profile_edit_bloc.dart';
import 'image_resource_dialog.dart';

class BannerProfile extends StatelessWidget {
  final ImagePicker picker = ImagePicker();

  BannerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorProfileEditBloc, CreatorProfileEditState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKey.bannerTitle.tr,
              style: AppStyles.fontSize14(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            20.height,
            GestureDetector(
              onTap: () {
                _showImageResource(context);
              },
              child: SizedBox(
                height: 177,
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: AppBorderSplit(
                        dashWidth: 3.0,
                        dashSpace: 3.0,
                        color: Colors.black,
                        strokeWidth: 2.0,
                        borderRadius: 10.borderRadiusAll,
                      ),
                      child: AppImage(
                        image: state.cover?.path ?? '${state.user!.getCoverPath()}',
                        width: Get.width,
                        height: 177,
                        fit: BoxFit.cover,
                        radius: 10,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          _showImageResource(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.ic_upload_svg),
                            Text(
                              LocaleKey.tipChangeBanner.tr,
                              style: AppStyles.fontSize10(
                                  fontWeight: FontWeight.w600, height: 20 / 10, color: AppColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _showImageResource(BuildContext context) {
    Get.dialog(
      ImageResourceDialog(
        onConfirmPressed: (imageResource) async {
          final permission = imageResource == ImageSource.camera ? Permission.camera : Permission.photos;
          final type = imageResource == ImageSource.camera ? PermissionType.camera : PermissionType.photos;
          final isGranted = (Platform.isAndroid && imageResource == ImageSource.gallery)
              ? true
              : await PermissionManager().checkPermission(permission, type);
          if(isGranted) {
            final XFile? image = await picker.pickImage(source: imageResource);
            if (image?.path.isNotEmpty ?? false) {
              if (context.mounted) {
                context.read<CreatorProfileEditBloc>().add(OnCoverSelected(File(image?.path ?? '')));
              }
            }
          }
        },
      ),
      barrierDismissible: true,
    );
  }
}
