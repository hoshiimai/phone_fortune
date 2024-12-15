import 'package:callmobile/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:callmobile/utils/app_assets.dart';

class BasePage extends StatelessWidget {
  //   /// When screen has [TextField] or [TextFormField]
  //   /// Default is false
  //   ///
  //   /// If this is true, then touching outside [TextField] or [TextFormField]
  //   /// will unFocus and hide the keyboard
  final bool unFocusWhenTouchOutsideInput;

  final bool isBackground;
  final bool isShowLogo;
  final bool isGradientBackground;

  //   /// The widget below this widget in the tree.
  //   ///
  //   /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  const BasePage({
    super.key,
    required this.child,
    this.unFocusWhenTouchOutsideInput = false,
    this.isBackground = true,
    this.isShowLogo = false,
    this.isGradientBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    return unFocusWhenTouchOutsideInput
        ? GestureDetector(
            onTap: () => Get.focusScope?.unfocus(),
            child: isBackground
                ? Container(
                    width: Get.width,
                    height: Get.height,
                    decoration: isGradientBackground
                        ? BoxDecoration(
                            gradient: AppColors.gradient(
                                begin: Alignment.centerLeft, end: Alignment.centerRight))
                        : null,
                    child: Stack(children: [
                      if (isShowLogo) ...[
                        Positioned(
                          top: MediaQuery.of(context).padding.top,
                          left: 30,
                          right: 30,
                          child: Image.asset(
                            AppAssets.logo_png,
                            width: 76,
                            height: 76,
                          ),
                        ),
                      ],
                      child
                    ]),
                  )
                : child,
          )
        : isBackground
            ? Container(
                width: Get.width,
                height: Get.height,
                decoration: isGradientBackground
                    ? BoxDecoration(
                        gradient: AppColors.gradient(
                            begin: Alignment.centerLeft, end: Alignment.centerRight))
                    : null,
                child: Stack(
                  children: [
                    if (isShowLogo) ...[
                      Positioned(
                        top: MediaQuery.of(context).padding.top,
                        left: 30,
                        right: 30,
                        child: Image.asset(
                          AppAssets.logo_png,
                          width: 76,
                          height: 76,
                        ),
                      ),
                    ],
                    child
                  ],
                ),
              )
            : child;
  }
}
