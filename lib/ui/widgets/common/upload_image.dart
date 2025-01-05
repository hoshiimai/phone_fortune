import 'package:flutter/material.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_border_split.dart';
import 'package:callmobile/utils/app_colors.dart';

class UploadImage extends StatelessWidget {
  final double width;
  final double height;
  final String? img;

  const UploadImage({
    super.key,
    required this.width,
    required this.height,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AppBorderSplit(
        dashWidth: 3.0,
        dashSpace: 3.0,
        color: AppColors.colorBEBEBE,
        strokeWidth: 1.0,
        borderRadius: 6.borderRadiusAll,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: 6.borderRadiusAll,
        ),
        // child: Center(
        //   child: img != null && img!.isNotEmpty
        //       ? AppImage(
        //           image: img ?? "",
        //           fit: BoxFit.cover,
        //         )
        //       : SvgPicture.asset(
        //           AppAssets.ic_upload_svg,
        //           colorFilter: const ui.ColorFilter.mode(AppColors.colorBEBEBE, BlendMode.srcIn),
        //         ),
        // ),
      ),
    );
  }
}
