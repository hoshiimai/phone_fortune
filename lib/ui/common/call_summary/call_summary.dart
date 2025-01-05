import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/common/call_summary/interactor/call_summary_bloc.dart';
import 'package:callmobile/ui/creator/home/interactor/creator_home_bloc.dart' as creatorHome;
import 'package:callmobile/ui/creator/main/interactor/main_creator_bloc.dart' as creator;
import 'package:callmobile/ui/creator/waiting/interactor/waiting_bloc.dart' as creatorWaiting;
import 'package:callmobile/ui/fan/home/interactor/home_bloc.dart' as fanHome;
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/model/argument/call_summary_argument.dart';
import '../../../core/model/enum/enum_bottom_navigation_page.dart';

import '../../../utils/app_api_config.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/app_utils.dart';
import '../../base/base_page.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_image.dart';
import '../../widgets/app_single_scrollview.dart';
import '../../fan/main/interactor/main_bloc.dart';

class CallSummary extends StatelessWidget {
  final CallSummaryArgument argument;
  const CallSummary({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocProvider.value(
        value: Get.find<CallSummaryBloc>()..add(Init(roomId: argument.roomId,)),
        child: BlocBuilder<CallSummaryBloc, CallSummaryState>(builder: (context, state) {
          final room = state.room;
          final isCreator = Get.find<AppShared>().getUser()?.role == Role.creator;
          final description = isCreator ? 'ファンとのLIVEチャットが\n終了しました' : '${room?.creatorInfo?.fullName ?? argument.user.fullName}さんとのツーショットが\n終了しました';
          final avatarUrl = isCreator ? room?.creatorInfo?.avatarFilePath : room?.fanInfo?.avatarFilePath;
          final avatar = (avatarUrl?.isEmpty ?? true)
              ? AppAssets.ic_avatar_default_svg
              : '${AppApiConfig.baseApiUrl}$avatarUrl';
          return Scaffold(
            extendBodyBehindAppBar: true,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: AppDimensions.sideMargins.copyWith(bottom: 20),
              child: AppButton(
                height: 62,
                title: '終了してトップへ戻る',
                onTap: () {
                  final isFan = Get.find<AppShared>().getUser()?.role == Role.fan;
                  // Force to clear stack and navigate to home page
                  if(isFan) {
                    Get.find<MainBloc>()
                      ..add(const OnChangeTabEvent(BottomNavigationPage.home))
                      ..add(const OnChangeTabEvent(BottomNavigationPage.home));
                    Get.find<fanHome.HomeBloc>().add(const fanHome.OnGetListIdol(isRefresh: true));
                  } else {
                    Get.find<creator.MainCreatorBloc>()
                      ..add(const creator.OnChangeTabEvent(BottomNavigationPage.home))
                      ..add(const creator.OnChangeTabEvent(BottomNavigationPage.home));
                    Get.find<creatorHome.CreatorHomeBloc>().add(const creatorHome.OnGetWaitingFans(isRefresh: true));
                    if(Get.isRegistered<creatorWaiting.WaitingBloc>())  {
                      Get.find<creatorWaiting.WaitingBloc>().add(const creatorWaiting.OnGetWaitingFans());
                    }
                  }
                },
                enable: true,
              ),
            ),
            body: BasePage(
              isBackground: false,
              child: AppSingleScrollView(
                child: Column(children: [
                  200.height,
                  AppImage(
                    image: avatar,
                    width: 200,
                    height: 200,
                    radius: 100,
                  ),
                  30.height,
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: AppColors.colorC7C7C7.withOpacity(0.29)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(AppAssets.ic_call_finish_svg, width: 13, height: 13,),
                        6.width,
                        Text(
                          AppUtils.convertSecondToTime(room?.callTiming ?? argument.durationInSecond),
                          style: AppStyles.fontSize12(color: AppColors.color616161),
                        ),
                      ],
                    ),
                  ),
                  30.height,
                  Text(
                    description,
                    style: AppStyles.fontSize16(fontWeight: FontWeight.w600, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  30.height,
                ]),
              ),
            ),
          );
        }),
      ),
    );
  }
}
