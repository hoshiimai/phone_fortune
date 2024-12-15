import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_gradient_text.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../locale/locale_key.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_image.dart';
import '../interactor/call_bloc.dart';
import 'call_item.dart';

class WaitingView extends StatelessWidget {
  final Function() onCancel;
  final Function() onMute;
  final Function() onOffVideo;
  final Function() onSwitchCamera;
  final Function() onTimeOut;
  const WaitingView({
    super.key,
    required this.onCancel,
    required this.onMute,
    required this.onOffVideo,
    required this.onSwitchCamera,
    required this.onTimeOut,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallBloc, CallState>(builder: (context, state) {
      return Column(
        children: [
          80.height,
          Stack(
            children: [
              const AppImage(
                image: AppAssets.bg_avatar_png,
                width: 200,
                height: 200,
                radius: 100,
              ),
              CircularPercentIndicator(
                radius: 100,
                lineWidth: 2,
                animation: true,
                animationDuration: 30000,
                percent: 1,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: AppColors.primary,
                onAnimationEnd: () {
                  if (!state.inCalling) {
                    onTimeOut.call();
                  }
                },
              )
            ],
          ),
          30.height,
          Center(
            child: AppGradientText(
              text: 'ナナコ',
              style: AppStyles.fontSize24(
                fontWeight: FontWeight.w600,
              ),
              gradient: AppColors.gradient(),
            ),
          ),
          28.height,
          Text(
            LocaleKey.callingContent.tr,
            style: AppStyles.fontSize14(
              height: 21 / 14,
            ),
            textAlign: TextAlign.center,
          ),
          28.height,
          const AppImage(image: AppAssets.ic_sound_effect_png, width: 40, height: 40,),
          12.height,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: AppColors.colorFFCE89.withOpacity(0.29)
            ),
            child: Text(
              '00:00',
              style: AppStyles.fontSize12(color: AppColors.color616161),
            ),
          ),
          28.height,
          Padding(
            padding: 40.paddingHorizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CallItem(
                  icon: state.isMute ? AppAssets.ic_voice_off_svg : AppAssets.ic_voice_on_svg,
                  title: LocaleKey.voice.tr,
                  onTap: () {
                    //TODO: remove
                    onTimeOut.call();
                  },
                ),
                60.width,
                CallItem(
                  icon: AppAssets.ic_sound_on_svg,
                  title: LocaleKey.soundOff.tr,
                  onTap: () {
                    onOffVideo.call();
                  },
                )
              ],
            ),
          ),
          const Spacer(),
          AppButton(
            height: 50,
            width: 92,
            onTap: () {
              onCancel.call();
            },
            backgroundColor: AppColors.colorCA0006,
            child: SvgPicture.asset(AppAssets.ic_end_call_svg),
          ),
          40.height
        ],
      );
    });
  }
}
