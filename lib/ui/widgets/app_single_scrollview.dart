import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSingleScrollView extends StatelessWidget {
  final Widget child;
  const AppSingleScrollView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: Get.width, minHeight: Get.height),
        child: IntrinsicHeight(child: child),
      ),
    );
  }
}
