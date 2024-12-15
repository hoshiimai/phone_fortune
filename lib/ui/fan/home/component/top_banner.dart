import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(AppAssets.bg_banner_png, height: 150, fit: BoxFit.fill,),
          10.height,
          Padding(
            padding: 16.paddingHorizontal,
            child: Text('🌟 今年最後のビッグイベント！！🌟🌟', style: AppStyles.fontSize14(),),
          ),
          10.height,
        ],
      ),
    );
  }
  
}