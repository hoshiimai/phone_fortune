import 'package:callmobile/core/model/business/call_history.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:callmobile/utils/app_utils.dart';
import 'package:flutter/material.dart';

import '../../../core/model/business/fan_waiting_info.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../app_gradient_text.dart';
import '../app_image.dart';

class FanWaitingItem extends StatefulWidget {
  final int? callDurationInSec;
  final int index;
  final FanWaitingInfo info;
  final bool? isShow;

  const FanWaitingItem({super.key, required this.index, required this.info, this.isShow, this.callDurationInSec});

  @override
  FanWaitingItemState createState() {
    return FanWaitingItemState();
  }
}

class FanWaitingItemState extends State<FanWaitingItem> {
  late bool isShow;

  @override
  void initState() {
    super.initState();
    isShow = widget.isShow != null ? widget.isShow! : false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShow = !isShow;
        });
      },
      child: Container(
        margin: widget.callDurationInSec == null ? 10.paddingBottom : EdgeInsets.zero,
        padding: 1.paddingAll,
        decoration: BoxDecoration(
          gradient: AppColors.gradientSwitchSelected(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: 10.paddingAll,
                child: widget.callDurationInSec != null ? _lastCallDurationView(): _waitingView(),
              ),
              isShow
                  ? Container(
                color: AppColors.colorD7E2FE,
                height: 1,
              )
                  : const SizedBox.shrink(),
              isShow
                  ? Padding(
                padding: 8.paddingAll,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.info.title,
                      style: AppStyles.fontSize12(color: AppColors.color64748B, height: 20 / 12),
                    ),
                    10.height,
                    Container(
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorF6F6F6,
                        ),
                        child: Text(
                          widget.info.description,
                          style: AppStyles.fontSize12(height: 20 / 12),
                        )),
                    if (widget.info.historyCalls.isNotEmpty)
                      Container(
                        margin: 8.paddingTop,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '通話履歴',
                              style: AppStyles.fontSize14(
                                  color: AppColors.colorFF7B98, fontWeight: FontWeight.w600, height: 17 / 14),
                            ),
                            10.height,
                            ...widget.info.historyCalls.asMap().entries.map<Widget>((entry) {
                              int index = entry.key;
                              var callHistory = entry.value;
                              return historyItem(
                                  callHistory, index, callHistory != widget.info.historyCalls.last);
                            })
                          ],
                        ),
                      )
                  ],
                ),
              )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  Widget historyItem(CallHistory callHistory, int index, bool hasDivider) {
    String dateTime = AppUtils.formatDate(callHistory.date, format: 'yyyy/MM/dd(EEE) HH:mm:ss');
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Row(
            children: [
              AppGradientText(
                text: '${index+1}回前',
                style: AppStyles.fontSize12(fontWeight: FontWeight.bold, height: 15 / 12,),
                gradient: AppColors.gradientCenterHorizontal(
                    startColor: AppColors.colorFFAD00, endColor: AppColors.colorFFB397),
              ),
              Expanded(
                  child: Text(
                dateTime,
                style: AppStyles.fontSize14(color: AppColors.color020617, fontWeight: FontWeight.w500, height: 15 / 12),
                textAlign: TextAlign.center,
              )),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.colorFF7B98,
                    )),
                child: AppGradientText(
                  text: '${callHistory.durationInMin}分',
                  style: AppStyles.fontSize12(fontWeight: FontWeight.bold, height: 15 / 12),
                  gradient: AppColors.gradientCenterHorizontal(
                      startColor: AppColors.colorFFAD00, endColor: AppColors.colorFFB397),
                ),
              )
            ],
          ),
        ),
        if (hasDivider)
          Container(
            color: AppColors.colorD7E2FE,
            height: 1,
          )
      ],
    );
  }

  Widget _waitingView() {
    return Row(
      children: [
        Padding(
          padding: 8.paddingRight,
          child: const AppImage(
            image: AppAssets.bg_avatar_png,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
            radius: 100,
          ),
        ),
        Expanded(
            child: Text(
              '${widget.index} ${widget.info.name}',
              style: AppStyles.fontSize14(
                  color: AppColors.color020617, fontWeight: FontWeight.w600, height: 21 / 14),
              overflow: TextOverflow.ellipsis,
            )),
        16.width,
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.colorFF7B98,
              )),
          child: AppGradientText(
            text: '${widget.info.waitingInMinute}分待ち',
            style: AppStyles.fontSize14(fontWeight: FontWeight.bold, height: 21 / 14),
            gradient: AppColors.gradientCenterHorizontal(
                startColor: AppColors.colorFFAD00, endColor: AppColors.colorFFB397),
          ),
        ),
        4.width,
        Image.asset(
          isShow ? AppAssets.ic_up_png : AppAssets.ic_down_png,
          width: 11,
          height: 8,
        ),
      ],
    );
  }

  Widget _lastCallDurationView() {
    final duration = AppUtils.formatDurationInJapanese(widget.callDurationInSec!);
    return Row(
      children: [
        Expanded(
            child: Text(
              '通話経過時間',
              style: AppStyles.fontSize14(
                  color: AppColors.color020617, fontWeight: FontWeight.w600, height: 21 / 14),
              overflow: TextOverflow.ellipsis,
            )),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.colorFF7B98,
              )),
          child: AppGradientText(
            text: duration,
            style: AppStyles.fontSize14(fontWeight: FontWeight.bold, height: 21 / 14),
            gradient: AppColors.gradientCenterHorizontal(
                startColor: AppColors.colorFFAD00, endColor: AppColors.colorFFB397),
          ),
        ),
        4.width,
        Image.asset(
          isShow ? AppAssets.ic_up_png : AppAssets.ic_down_png,
          width: 11,
          height: 8,
        ),
      ],
    );
  }
}
