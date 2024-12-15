import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_colors.dart';

class ActionCallItem extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final Color? backgroundColor;

  const ActionCallItem({
    super.key,
    required this.icon,
    this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.black50,
          borderRadius: 10.borderRadiusAll,
        ),
        child: SvgPicture.asset(
          icon,
          width: 33,
          height: 30,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
