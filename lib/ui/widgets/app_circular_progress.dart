import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:callmobile/utils/app_colors.dart';

class AppCircularProgress extends StatelessWidget {
  final Color color;

  const AppCircularProgress({super.key, this.color = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              color: color,
            )
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color),
              strokeWidth: 1.5,
            ),
    );
  }
}
