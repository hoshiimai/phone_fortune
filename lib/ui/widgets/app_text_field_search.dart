import 'package:flutter/material.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_assets.dart';

class AppTextFieldSearch extends StatefulWidget {
  const AppTextFieldSearch({
    this.hintText = '',
    this.errors = const <String>[],
    this.controller,
    this.onChanged,
    this.onTap,
    this.onCompleted,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 30,
    this.maxLength = 255,
    this.height = 110,
    this.hintStyle,
    this.borderColor,
    this.textStyleColor,
    this.textStyle,
    this.gradient,
    this.onSearchClick,
    super.key,
  });

  final String hintText;
  final TextStyle? hintStyle;

  final List<String> errors;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final void Function(String)? onCompleted;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double borderRadius;
  final int maxLength;
  final double height;
  final Color? borderColor;
  final Color? textStyleColor;
  final TextStyle? textStyle;
  final LinearGradient? gradient;
  final void Function(String)? onSearchClick;

  @override
  State<AppTextFieldSearch> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextFieldSearch> {
  @override
  Widget build(BuildContext context) {
    return _buildSingleLineTextField();
  }

  _buildSingleLineTextField() {
    return Column(
      children: [
        GradientBorderContainer(
          alignment: Alignment.center,
          padding: 22.paddingHorizontal,
          height: 62,
          width: double.infinity,
          borderRadius: widget.borderRadius,
          gradient: widget.gradient,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            onTap: widget.onTap,
            onSubmitted: widget.onCompleted,
            onChanged: (value) {
              setState(() {
                if (widget.errors.isNotEmpty) {
                  widget.errors.clear();
                }
              });
              widget.onChanged != null ? widget.onChanged!(value) : null;
            },
            controller: widget.controller,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  iconSize: 22,
                  highlightColor: Colors.transparent,
                  icon: SvgPicture.asset(
                    AppAssets.ic_search_svg,
                    width: 22,
                    height: 22,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () => widget.onSearchClick?.call(widget.controller?.text ?? ''),
                ),
                border: InputBorder.none,
                counterText: '',
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? AppStyles.fontSize14(color: AppColors.colorDEDEDE)),
            keyboardType: widget.keyboardType,
            style: AppStyles.fontSize14(color: widget.textStyleColor ?? AppColors.white),
            textAlign: TextAlign.start,
            maxLength: widget.maxLength,
          ),
        ),
        Visibility(
          visible: widget.errors.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Column(
              children: widget.errors
                  .map(
                    (e) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(e, style: AppStyles.fontSize14(color: AppColors.red)),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}

class GradientBorderContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Gradient? gradient;
  final double borderWidth;
  final Alignment alignment;
  final EdgeInsets? padding;
  final double height;
  final double width;

  const GradientBorderContainer({
    required this.child,
    required this.borderRadius,
    required this.gradient,
    this.borderWidth = 1.0,
    super.key,
    required this.alignment,
    this.padding,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(
          borderRadius: borderRadius, gradient: gradient, borderWidth: borderWidth),
      child: Container(
        alignment: alignment,
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          // color: AppColors.white,
        ),
        child: child,
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double borderRadius;
  final Gradient? gradient;
  final double borderWidth;

  GradientBorderPainter({
    required this.borderRadius,
    required this.gradient,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final borderRect = Rect.fromLTWH(
        borderWidth / 2, borderWidth / 2, size.width - borderWidth, size.height - borderWidth);
    final paint = Paint()
      ..shader = gradient?.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final borderRadius = this.borderRadius - borderWidth / 2;
    final rrect = RRect.fromRectAndRadius(borderRect, Radius.circular(borderRadius));

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
