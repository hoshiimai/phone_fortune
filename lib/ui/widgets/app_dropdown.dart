import 'package:flutter/material.dart';

import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_option_dialog.dart';

import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    super.key,
    required this.title,
    required this.items,
    required this.onSelectedItem,
    this.initValue,
    this.errors = const <String>[],
    this.width,
    this.height,
    this.colorBorder,
    this.icon,
    this.textStyleColor,
    this.isDropDownTime,
    this.getIcon,
    required this.getName,
  });

  final String title;
  final List<T> items;
  final Function(T) onSelectedItem;
  final T? initValue;
  final List<String> errors;
  final double? width;
  final double? height;
  final bool? isDropDownTime;
  final Color? colorBorder;
  final String? icon;
  final Color? textStyleColor;
  final String Function(T?)? getIcon;
  final String Function(T?) getName;

  @override
  State<AppDropDown<T>> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>> {
  T? selectedValue;
  @override
  Widget build(BuildContext context) {
    if (selectedValue != widget.initValue) {
      selectedValue = widget.initValue;
    }
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        showDialog(
            context: context,
            builder: (context) => AppOptionDialog(
                  items: widget.items,
                  beforeSelected: selectedValue,
                  onSelectedItem: (value, index) {
                    setState(() {
                      selectedValue = value;
                      if (widget.errors.isNotEmpty) widget.errors.clear();
                      widget.onSelectedItem(value);
                    });
                  },
                  getName: widget.getName,
                ));
      },
      child: Column(
        children: [
          Container(
              height: widget.height ?? 50,
              width: widget.width ?? double.infinity,
              padding: const EdgeInsets.only(left: 20, right: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: widget.colorBorder ?? AppColors.white)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (widget.getIcon != null && selectedValue != null) ...[
                        Image.asset(widget.getIcon!(selectedValue), width: 20, height: 20),
                        10.width,
                      ],
                      Text(
                        (selectedValue != null && widget.items.contains(selectedValue))
                            ? widget.getName(selectedValue)
                            : widget.title,
                        overflow: TextOverflow.fade,
                        style:
                            AppStyles.fontSize14(color: widget.textStyleColor ?? AppColors.white),
                      ),
                    ],
                  ),
                  // Container(
                  //     padding: const EdgeInsets.only(top: 2),
                  //     width: widget.isDropDownTime == true ? 10 : 14,
                  //     height: widget.isDropDownTime == true ? 10 : 14,
                  //     child: SvgPicture.asset(
                  //       widget.icon ?? AppAssets.ic_dropdown_svg,
                  //     ))
                ],
              )),
          Visibility(
            visible: widget.errors.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Column(
                children: widget.errors
                    .map((e) => Align(alignment: Alignment.centerLeft, child: Text(e)))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
