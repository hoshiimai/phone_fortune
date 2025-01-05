import 'dart:async';

import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:callmobile/utils/app_utils.dart';
import 'package:flutter/material.dart';

import '../../../core/model/response/model/history_call.dart';
import '../../../core/model/response/model/user.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../app_gradient_text.dart';
import '../app_image.dart';

class FanWaitingItem extends StatefulWidget {
  final int? callDurationInSec;
  final int index;
  final User fan;
  final bool? isShow;

  const FanWaitingItem({super.key, required this.index, required this.fan, this.isShow, this.callDurationInSec});

  @override
  FanWaitingItemState createState() {
    return FanWaitingItemState();
  }
}

class FanWaitingItemState extends State<FanWaitingItem> {
  late bool isShow;
  Timer? waitingCalculationTimer;
  int? waitingTimeMinutes;

  @override
  void initState() {
    super.initState();
    waitingTimeMinutes = widget.fan.timeWaiting ?? 0;
    isShow = widget.isShow != null ? widget.isShow! : false;
    waitingCalculationTimer = Timer.periodic(const Duration(seconds: 60), (s) {
      setState(() {
        waitingTimeMinutes  = waitingTimeMinutes! + 1;
      });
    });
  }

  @override
  void dispose() {
    waitingCalculationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final historyCall = widget.fan.historyCall?.toList()?..sort((item1, item2) => item2.createdAt.compareTo(item1.createdAt));
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
                      'ユーザーを覚えておいてください',
                      style: AppStyles.fontSize12(color: AppColors.color64748B, height: 20 / 12),
                    ),
                    10.height,
                    Container(
                      width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.colorF6F6F6,
                        ),
                        child: Text(
                            widget.fan.welcomeMessages ?? '',
                          style: AppStyles.fontSize12(height: 20 / 12),
                        )),
                    if (historyCall?.isNotEmpty ?? false)
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
                            ...historyCall!.asMap().entries.map<Widget>((entry) {
                              int index = entry.key;
                              var callHistory = entry.value;
                              return historyItem(
                                  callHistory, index, callHistory != historyCall.last);
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

  Widget historyItem(HistoryCall history, int index, bool hasDivider) {
    String dateTime = AppUtils.formatDate(history.createdAt.toLocal(), format: 'yyyy/MM/dd(EEE) HH:mm:ss');
    final callDurationAsMin = history.callTiming == 0
        ? 0
        : (history.callTiming ~/ 60) + (history.callTiming % 60 == 0 ? 0 : 1);
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
                  text: '$callDurationAsMin分',
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
          child: AppImage(
            image: widget.fan.getAvatarPath(),
            width: 30,
            height: 30,
            fit: BoxFit.cover,
            radius: 100,
          ),
        ),
        Expanded(
            child: Text(
              '${widget.index} ${widget.fan.fullName}',
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
            text: AppUtils.formatDurationMinToHourJapanese(waitingTimeMinutes ?? 0),
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
