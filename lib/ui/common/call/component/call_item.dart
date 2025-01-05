import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_styles.dart';

class CallItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const CallItem({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(icon, colorFilter: const ColorFilter.mode(
            AppColors.color616161,
            BlendMode.srcIn,
          )),
          5.height,
          Text(title, style: AppStyles.fontSize10(height: 15 / 10))
        ],
      ),
    );
  }
}
