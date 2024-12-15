import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_styles.dart';

class ButtonOnOff extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ButtonOnOff({
    super.key,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedContainer(
        width: 77,
        height: 42,
        padding: 5.paddingHorizontal.copyWith(left: value ? 10 : 5, right: value ? 5 : 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: value ? AppColors.gradientSwitch() : AppColors.gradientBackgroundOffline(),
        ),
        duration: const Duration(milliseconds: 300),
        child: Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: value ? 1 : 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  LocaleKey.on.tr,
                  style: AppStyles.fontSize12(
                      fontFamily: AppStyles.fontHiraginoKakuProW6, height: 20 / 12),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: value ? 0 : 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  LocaleKey.off.tr,
                  style: AppStyles.fontSize12(
                      fontFamily: AppStyles.fontHiraginoKakuProW6, height: 20 / 12),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: value ? 30.0 : 0.0,
              top: 5.0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 31.5,
                height: 31.5,
                padding: 9.paddingAll,
                decoration: BoxDecoration(
                  gradient: value ? AppColors.gradient() : AppColors.gradientOffline(),
                  borderRadius: BorderRadius.circular(50),
                ),
                // child: SvgPicture.asset(
                // value ? AppAssets.ic_call_new_svg : AppAssets.ic_call_offline_svg,
                // fit: BoxFit.cover,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
