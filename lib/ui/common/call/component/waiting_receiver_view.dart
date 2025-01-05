import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/app_gradient_text.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_image.dart';
import '../interactor/call_bloc.dart';
import 'call_item.dart';

class WaitingReceiverView extends StatelessWidget {
  final Function() onAccept;
  final Function() onCancel;
  final Function() onMute;
  final Function() onUpdateSpeaker;
  final Function() onSwitchCamera;
  const WaitingReceiverView({
    super.key,
    required this.onAccept,
    required this.onCancel,
    required this.onMute,
    required this.onUpdateSpeaker,
    required this.onSwitchCamera,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallBloc, CallState>(builder: (context, state) {
      return Column(
        children: [
          80.height,
          Stack(
            children: [
              AppImage(
                image: state.callingUser?.getAvatarPath() ?? '',
                width: 200,
                height: 200,
                radius: 100,
              ),
            ],
          ),
          25.height,
          SvgPicture.asset(
            AppAssets.ic_rank_5_svg,
            width: 45,
            height: 20,
          ),
          22.height,
          Center(
            child: AppGradientText(
              text: state.callingUser?.fullName ?? '',
              style: AppStyles.fontSize24(
                fontWeight: FontWeight.w600,
              ),
              gradient: AppColors.gradientCenterHorizontal(
                  startColor: AppColors.colorFFAD00, endColor: AppColors.colorFFB397),
            ),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CallItem(
                  icon: AppAssets.ic_voice_on_svg,
                  title: 'マイクをオン',
                  onTap: () {},
                ),
                CallItem(
                  icon: AppAssets.ic_sound_on_svg,
                  title: '音声オン',
                  onTap: () {},
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: 22.paddingAll.copyWith(top: 0, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  height: 50,
                  width: 92,
                  onTap: () {
                    onCancel.call();
                  },
                  backgroundColor: AppColors.colorCA0006,
                  child: SvgPicture.asset(AppAssets.ic_close_svg),
                ),
                AppButton(
                  height: 50,
                  width: 92,
                  onTap: () {
                    onAccept.call();
                  },
                  backgroundColor: AppColors.color01DF3C,
                  child: SvgPicture.asset(AppAssets.ic_call_new_svg),
                ),
              ],
            ),
          ),
          40.height
        ],
      );
    });
  }
}
