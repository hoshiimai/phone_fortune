import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

import '../app_gradient_text.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({
    super.key,
    this.height = kToolbarHeight,
    this.backgroundColor,
    this.implyLeading = true,
    this.title = '',
    this.actions,
    this.padding,
    this.componentsColor,
    this.titleWidget,
    this.scrolledUnderElevation,
    this.onBack,
    this.isShowLogo = false,
    this.centerTitle = true,
    this.iconLeading,
    this.icon = AppAssets.ic_menu_svg,
    this.isShownPoint = true,
  });

  final double height;
  final Color? backgroundColor;
  final bool implyLeading;
  final String title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final Color? componentsColor;
  final Widget? titleWidget;
  final double? scrolledUnderElevation;
  final bool isShowLogo;
  final Function()? onBack;
  final bool centerTitle;
  final String? iconLeading;
  final String icon;
  final bool isShownPoint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorF2F2F2),
            borderRadius: BorderRadius.circular(60)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.logo_png),
              Padding(
                padding: 5.paddingAll,
                child: SvgPicture.asset(icon,),
              )
            ],
          ),
        ),
        titleSpacing: 0,
        centerTitle: centerTitle,
        leadingWidth: 98,
        title: AppGradientText(
          text: title,
          style: AppStyles.fontSize16(
            fontWeight: FontWeight.w600,
          ),
          gradient: AppColors.gradient(),
        ),
        // Make sure appbar don't change background color when scroll
        surfaceTintColor: backgroundColor ?? AppColors.transparent,
        actions: actions,
        scrolledUnderElevation: scrolledUnderElevation,
        backgroundColor: backgroundColor ?? AppColors.transparent,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
