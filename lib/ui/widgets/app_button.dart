import 'package:flutter/material.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? highlightColor;
  final ShapeBorder? customBorder;
  final bool enable;
  final double? height;
  final EdgeInsets? padding;
  final String? title;
  final Color? colorTitle;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final Color disabledColor;
  final EdgeInsets? margin;
  final double thickness;
  final double fontSizeTitle;
  final FontWeight? fontWeight;
  final BoxBorder? border;
  final LinearGradient? gradient;

  const AppButton({
    super.key,
    this.child,
    this.onTap,
    this.onLongPress,
    this.backgroundColor,
    this.borderRadius,
    this.customBorder,
    this.highlightColor,
    this.enable = true,
    this.height,
    this.padding,
    this.title,
    this.colorTitle,
    this.boxShadow,
    this.width,
    this.disabledColor = Colors.white54,
    this.margin,
    this.thickness = 1,
    this.fontSizeTitle = 16,
    this.fontWeight,
    this.border,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.all(99.radius),
          boxShadow: enable
              ? boxShadow ??
                  [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ]
              : null,
          border: border,
          color: backgroundColor,
          gradient: backgroundColor == null ? gradient ?? AppColors.gradient() : null),
      child: MaterialButton(
        color: AppColors.transparent,
        disabledColor: AppColors.colorC8C8C8,
        highlightColor: AppColors.primary,
        elevation: 0,
        minWidth: double.infinity,
        height: height,
        shape: customBorder ??
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.all(99.radius),
              side: BorderSide.none,
            ),
        onPressed: enable ? onTap : null,
        onLongPress: enable ? onLongPress : null,
        padding: padding ?? const EdgeInsets.all(16),
        child: title != null
            ? Text(
                title!,
                style: AppStyles.fontSize16(
                  fontWeight: FontWeight.w800,
                  fontFamily: AppStyles.fontHiraginoKakuStd,
                  height: 24 / 16,
                  color: AppColors.white
                ),
              )
            : child,
      ),
    );
  }
}
