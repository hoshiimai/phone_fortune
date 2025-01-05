import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class ItemInfo extends StatefulWidget {
  final String title;
  final String data;
  final bool showIcon;
  final VoidCallback? onTap;

  const ItemInfo({super.key, required this.title, required this.data, this.showIcon = false, this.onTap});

  @override
  State<ItemInfo> createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: AppStyles.fontSize14(
              fontWeight: FontWeight.w600,
              height: 21 / 14,
              color: AppColors.black,
            ),
          ),
          10.height,
          Row(
            children: [
              Expanded(
                child: Text(
                    widget.data,
                    style: AppStyles.fontSize14(
                      height: 21 / 14,
                      color: AppColors.black,
                    ),
                    textAlign: TextAlign.start),
              ),
              if(widget.showIcon) SvgPicture.asset(AppAssets.ic_arrow_right_svg)
            ],
          ),
          20.height,
          const Divider(color: AppColors.colorDEDEDE, height: 0.5)
        ],
      ),
    );
  }
}
