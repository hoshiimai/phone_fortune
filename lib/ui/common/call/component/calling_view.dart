import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/creator/main/interactor/main_creator_bloc.dart';
import 'package:callmobile/ui/widgets/app_gradient_text.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/app_utils.dart';
import '../../../widgets/app_image.dart';
import '../interactor/call_bloc.dart';
import 'action_call_item.dart';
import 'call_item.dart';

class CallingView extends StatelessWidget {
  final Function() onUpdateMic;
  final Function() hangUp;
  final Function() onUpdateSpeaker;

  const CallingView({
    super.key,
    required this.onUpdateMic,
    required this.hangUp,
    required this.onUpdateSpeaker,
  });

  @override
  Widget build(BuildContext context) {
    final isCreator = Get.find<AppShared>().getUser()?.role == Role.creator;

    return BlocBuilder<CallBloc, CallState>(builder: (context, state) {
      final avatar = state.callingUser?.getAvatarPath() ?? '';
      final name = state.callingUser?.fullName ?? '';
      return Column(
        children: [
          80.height,
          Stack(
            children: [
              AppImage(
                image: avatar,
                width: 200,
                height: 200,
                radius: 100,
              ),
            ],
          ),
          12.height,
          if (isCreator) ...[
            16.height,
            SvgPicture.asset(
              AppAssets.ic_rank_5_svg,
              width: 45,
              height: 20,
            )
          ],
          16.height,
          Center(
            child: AppGradientText(
              text: name,
              style: AppStyles.fontSize24(
                fontWeight: FontWeight.w600,
              ),
              gradient: AppColors.gradient(),
            ),
          ),
          28.height,
          const AppImage(
            image: AppAssets.ic_sound_effect_png,
            width: 40,
            height: 40,
          ),
          12.height,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(90), color: AppColors.colorFFCE89.withOpacity(0.29)),
            child: Text(
              AppUtils.convertSecondToTime(state.timeCall),
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
                  icon: state.isMicOn ? AppAssets.ic_voice_on_svg : AppAssets.ic_voice_off_svg,
                  title: 'マイクをオン',
                  onTap: () {
                    onUpdateMic.call();
                  },
                ),
                CallItem(
                  icon: AppAssets.ic_sound_on_svg,
                  title: '音声オン',
                  onTap: () {
                    onUpdateSpeaker.call();
                  },
                )
              ],
            ),
          ),
          28.height,
          const Spacer(),
          Container(
            padding: 8.paddingAll,
            decoration:
            BoxDecoration(color: AppColors.colorC9C9C9.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isCreator) ...[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: 10.borderRadiusAll,
                          gradient: AppColors.gradientCenterHorizontal(
                              startColor: AppColors.colorFFAD00, endColor: AppColors.colorFFB397)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const AppImage(
                              image: AppAssets.ic_waiting_group_png,
                              width: 14,
                              height: 14,
                              fit: BoxFit.scaleDown,
                            ),
                            StreamBuilder(
                                stream: Get.find<MainCreatorBloc>().stream,
                                initialData: Get.find<MainCreatorBloc>().state,
                                builder: (ctx, snapshot) {
                                  if (snapshot.hasData) {
                                    int waitingCount = snapshot.data?.waitingCount ?? 0;
                                    if(waitingCount > 0) {
                                      waitingCount -= 1;
                                    }
                                    return Text(
                                      '$waitingCount',
                                      style: AppStyles.fontSize14(
                                          color: AppColors.white, fontWeight: FontWeight.w600, height: 21 / 14),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  8.width,
                ],
                ActionCallItem(
                  onTap: onUpdateMic,
                  icon:  state.isMicOn ? AppAssets.ic_voice_on_svg : AppAssets.ic_voice_off_svg,
                ),
                8.width,
                ActionCallItem(
                  onTap: onUpdateSpeaker,
                  icon: AppAssets.ic_sound_on_svg,
                ),
                8.width,
                ActionCallItem(
                  onTap: hangUp,
                  icon: AppAssets.ic_end_call_svg,
                  backgroundColor: AppColors.colorCA0006,
                ),
              ],
            ),
          ),
          16.height
        ],
      );
    });
  }
}
