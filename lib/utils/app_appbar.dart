import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isShowLogo
          ? Padding(
        padding: 10.paddingAll,
        child: Image.asset(AppAssets.logo_png),
      )
          : implyLeading
          ? Padding(
        padding: padding ?? 5.paddingLeft,
        child: IconButton(
          onPressed: onBack ?? () => Navigator.pop(context),
          splashRadius: 24,
        icon: SvgPicture.asset(iconLeading ?? AppAssets.ic_back_svg),
        ),
      )
          : const SizedBox(),
      titleSpacing: 0,
      centerTitle: centerTitle,
      leadingWidth: isShowLogo
          ? 80
          : implyLeading
          ? 60
          : 24,
      title: titleWidget ?? Text(title, style: AppStyles.fontSize14(fontWeight: FontWeight.w600, color: AppColors.white)),
      // Make sure appbar don't change background color when scroll
      surfaceTintColor: backgroundColor ?? AppColors.transparent,
      actions: actions != null && actions!.isNotEmpty
          ? List.generate(
        actions!.length,
            (index) => actions![actions!.length - index - 1],
      )
          : null,
      scrolledUnderElevation: scrolledUnderElevation,
      backgroundColor: backgroundColor ?? AppColors.transparent,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
