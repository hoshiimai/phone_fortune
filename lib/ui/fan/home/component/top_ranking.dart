import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/common/creator_item.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/model/response/model/user.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/app_listview.dart';

class TopRanking extends StatelessWidget {
  final List<User> creators;
  const TopRanking({super.key, required this.creators});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 8.paddingAll,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                AppAssets.ic_ranking_png,
                width: 20,
                height: 20,
              ),
              10.width,
              Container(
                decoration:
                    BoxDecoration(gradient: AppColors.gradientSwitchSelected(), borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                child: Text(
                  'RANKING',
                  style: AppStyles.fontSize14(color: AppColors.white, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          10.height,
          _topButtons(),
          28.height,
          _creatorList(),
          28.height,
        ],
      ),
    );
  }

  Widget _topButtons() {
    return Row(
      children: [
        Expanded(
            child: Container(
              padding: 6.paddingVertical,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: AppColors.gradientSwitchSelected(),
              ),
              child: Text(
                '只今の\nオススメ',
                style: AppStyles.fontSize10(color: AppColors.white, height: 1.5),
                textAlign: TextAlign.center,
              ),
            )),
        10.width,
        Expanded(
            child: Container(
              padding: 6.paddingVertical,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.colorF2F2F2),
              child: Text('人気急上昇\nランキング',
                  style: AppStyles.fontSize10(color: AppColors.color616161, height: 1.5),
                  textAlign: TextAlign.center),
            )),
        10.width,
        Expanded(
            child: Container(
              padding: 6.paddingVertical,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.colorF2F2F2),
              child: Text('総合\nランキング',
                  style: AppStyles.fontSize10(color: AppColors.color616161, height: 1.5),
                  textAlign: TextAlign.center),
            )),
      ],
    );
  }

  Widget _creatorList() {
    return creators.isNotEmpty
        ? AppListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: creators.length,
            separatorBuilder: (ctx, index) => 10.height,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) => CreatorItem(
              creator: creators[index],
            ),
          )
        : Container(
            padding: 24.paddingVertical,
            child: Center(
              child: Text(
                'データなし',
                style: AppStyles.fontSize16(fontWeight: FontWeight.w400, color: AppColors.black),
              ),
            ),
          );
  }
}
