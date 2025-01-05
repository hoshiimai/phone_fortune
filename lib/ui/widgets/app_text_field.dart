import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

import '../../core/model/business/icon_type.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    this.hintText = '',
    this.isPassword = false,
    this.iconType,
    this.isCircle = false,
    this.errors = const <String>[],
    this.controller,
    this.onChanged,
    this.onTap,
    this.onCompleted,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 30,
    this.maxLength = 255,
    this.height = 62,
    this.hintStyle,
    this.borderColor,
    this.textStyleColor,
    this.textStyle,
    this.padding,
    this.inputFormatters,
    this.textInputAction,
    this.focusNode,
    this.onEditCompleted,
    super.key,
  });

  final String hintText;
  final TextStyle? hintStyle;
  final bool isPassword;
  final IconType? iconType;
  final bool isCircle;
  final List<String> errors;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final void Function(String)? onCompleted;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double borderRadius;
  final int maxLength;
  final double? height;
  final Color? borderColor;
  final Color? textStyleColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function? onEditCompleted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return widget.keyboardType == TextInputType.multiline
        ? _buildMultipleLineTextField()
        : _buildSingleLineTextField();
  }

  _buildSingleLineTextField() {
    IconData? iconData;
    if(widget.iconType == IconType.password) {
      iconData = _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    } else if (widget.iconType == IconType.calendar) {
      iconData = Icons.calendar_today_outlined;
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: widget.isCircle ? null : widget.padding ?? 22.paddingHorizontal,
          height: widget.height ?? 62,
          width: widget.isCircle ? 50 : double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(color: widget.borderColor ?? AppColors.colorBCBDCB)),
          child: TextField(
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction,
            onTap: widget.onTap,
            onSubmitted: widget.onCompleted,
            obscureText: widget.isPassword ? _obscureText : false,
            onChanged: (value) {
              setState(() {
                if (widget.errors.isNotEmpty) {
                  widget.errors.clear();
                }
              });
              widget.onChanged != null ? widget.onChanged!(value) : null;
            },
            onEditingComplete: widget.onEditCompleted != null
                ? () {
                    widget.onEditCompleted?.call();
                  }
                : null,
            inputFormatters: widget.inputFormatters,
            controller: widget.controller,
            decoration: InputDecoration(
                suffixIcon: (widget.iconType != null)
                    ? IconButton(
                        padding: 16.paddingBottom,
                        icon: Icon(iconData,),
                        color: widget.textStyleColor ?? AppColors.black,
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                suffixIconConstraints: const BoxConstraints(maxWidth: 24),
                border: InputBorder.none,
                counterText: '',
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? AppStyles.fontSize14(color: AppColors.colorC6C8DC)),
            keyboardType: widget.keyboardType,
            style: widget.isCircle
                ? AppStyles.fontSize14(color: widget.textStyleColor ?? AppColors.black)
                : AppStyles.fontSize14(color: widget.textStyleColor ?? AppColors.black),
            textAlign: widget.isCircle ? TextAlign.center : TextAlign.start,
            maxLength: widget.isCircle ? 1 : widget.maxLength,
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

  _buildMultipleLineTextField() {
    return Column(
      children: [
        Container(
          padding: 15.paddingHorizontal,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: widget.borderColor ?? AppColors.black),
          ),
          child: TextField(
            onTap: widget.onTap,
            onChanged: (value) {
              setState(() {
                if (widget.errors.isNotEmpty) {
                  widget.errors.clear();
                }
              });
              widget.onChanged != null ? widget.onChanged!(value) : null;
            },
            inputFormatters: widget.inputFormatters,
            // onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? AppStyles.fontSize14(color: AppColors.colorDEDEDE)),
            keyboardType: TextInputType.multiline,
            style: widget.textStyle ??
                AppStyles.fontSize14(
                    color: widget.textStyleColor ?? AppColors.black, height: 20 / 14),
            maxLines: 5,
            minLines: 1,
          ),
        ),
        Visibility(
          visible: widget.errors.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Column(
              children: widget.errors
                  .map((e) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(e, style: AppStyles.fontSize14(color: AppColors.red))))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
