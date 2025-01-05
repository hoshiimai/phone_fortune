import 'package:flutter/material.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class AppTabBar extends StatelessWidget {
  final int id;
  final String title;
  final int selectedTab;
  final Function()? onClick;

  const AppTabBar(
    this.id, {
    required this.title,
    required this.selectedTab,
    this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = selectedTab == id;
    return InkWell(
      onTap: () => onClick?.call(),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(minWidth: 51),
            padding: 5.paddingHorizontal,
            child: Text(
              title,
              style: isActive
                  ? AppStyles.fontSize16(
                      fontWeight: FontWeight.w600, color: AppColors.black, height: 24 / 16)
                  : AppStyles.fontSize12(
                      fontWeight: FontWeight.w600, color: AppColors.black, height: 18 / 12),
              textAlign: TextAlign.center,
            ),
          ),
          if (isActive)
            Container(
                constraints: const BoxConstraints(minWidth: 51),
                height: 3,
                decoration: BoxDecoration(
                    gradient: AppColors.gradient(), borderRadius: 100.borderRadiusAll))
        ],
      ),
    );
  }
}
