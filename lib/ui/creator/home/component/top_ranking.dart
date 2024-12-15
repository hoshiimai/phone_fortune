import 'package:callmobile/core/model/business/creator_status.dart';
import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/common/creator_item.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class TopRanking extends StatelessWidget {
  TopRanking({super.key});
  
  final creators = [
    Creator(name: '名前', comment: 'コメント', waitingFanCount: 10, status: CreatorStatus.away),
    Creator(name: '名前', comment: 'コメント', waitingFanCount: 1, status: CreatorStatus.away),
    Creator(name: '名前', comment: 'コメント', waitingFanCount: 6, status: CreatorStatus.away),
    Creator(name: '名前', comment: 'コメント', waitingFanCount: 0, status: CreatorStatus.available),
    Creator(name: '名前', comment: 'コメント', waitingFanCount: 0, status: CreatorStatus.offline),
    Creator(name: '名前', comment: 'コメント', waitingFanCount: 0, status: CreatorStatus.offline),
    Creator(name: '名前', comment: 'コメント', waitingFanCount: 0, status: CreatorStatus.offline),
  ];

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
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: creators.length,
      separatorBuilder: (ctx, index) => 10.height,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (ctx, index) => CreatorItem(creator: creators[index],),
    );
  }
}
