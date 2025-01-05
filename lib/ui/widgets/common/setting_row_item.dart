import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class SettingRowItem<T> extends StatelessWidget {
  final T item;
  final VoidCallback onTap;
  final String Function(T) getName;
  final String Function(T) getIcon;

  const SettingRowItem({
    super.key,
    required this.item,
    required this.getIcon,
    required this.getName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 17.paddingVertical,
      child: InkWell(
        onTap: onTap,
        child: Row(children: [
          Text(getName(item), style: AppStyles.fontSize14(color: AppColors.black, height: 21 / 14)),
          const Spacer(),
          SvgPicture.asset(getIcon(item))
        ]),
      ),
    );
  }
}
