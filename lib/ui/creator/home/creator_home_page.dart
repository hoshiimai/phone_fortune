import 'package:callmobile/core/model/business/call_history.dart';
import 'package:callmobile/core/model/business/fan_waiting_info.dart';
import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/core/model/response/model/history_call.dart';
import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/creator/home/component/status_setting.dart';
import 'package:callmobile/ui/creator/home/interactor/creator_home_bloc.dart';
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_bottom_navigation_page.dart';

import '../../../utils/app_appbar.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../base/base_page.dart';
import '../../widgets/base/app_body.dart';
import '../../widgets/common/fan_waiting_item.dart';
import '../../widgets/common/home_appbar.dart';
import '../main/interactor/main_creator_bloc.dart';
import 'component/recent_call.dart';
import 'component/schedule_setting.dart';
import 'component/waiting_section.dart';

class CreatorHomePage extends StatefulWidget {
  const CreatorHomePage({super.key});

  @override
  CreatorHomePageState createState() {
    return CreatorHomePageState();
  }
}

class CreatorHomePageState extends State<CreatorHomePage> {

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          // Pop page listener
          BlocListener<MainCreatorBloc, MainCreatorState>(
            bloc: Get.find<MainCreatorBloc>(),
            listenWhen: (p, c) => p.popPage != c.popPage,
            listener: (ctx, state) {
              if (state.popPage == BottomNavigationPage.home) {
                Navigator.of(context).popUntil((Route<dynamic> route) => route.settings.name == '/');
                Get.until((route) => Get.currentRoute == AppPages.mainCreator);
                Get.find<MainCreatorBloc>().add(const ResetPopPageCreator());
              }
            },
          ),
        ],
        child: BlocProvider(
          create: (context) => Get.find<CreatorHomeBloc>()..add(const Init(isRefresh: false)),
          child: BlocConsumer<CreatorHomeBloc, CreatorHomeState>(
            listener: (BuildContext context, CreatorHomeState state) {},
            builder: (BuildContext context, CreatorHomeState state) {
              final padding = MediaQuery.of(context).padding.top;
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: HomeAppbar(
                  icon: AppAssets.ic_renew_svg,
                  title: 'ホーム',
                  isShowLogo: true,
                  height: 98,
                ),
                body: BasePage(
                  isBackground: false,
                  child: Padding(
                    padding: EdgeInsets.only(top: 98 + padding - 10),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<CreatorHomeBloc>().add(const Init(isRefresh: true));
                        await Future<void>.delayed(const Duration(milliseconds: 500));
                      },
                      child: SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: Get.width,
                            minHeight: Get.height,
                          ),
                          color: AppColors.colorB0B9C0.withOpacity(0.2),
                          padding: AppDimensions.sideMargins,
                          child: AppBody(
                            pageState: state.status,
                            success: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                StatusSetting(
                                  status: state.currentStatus,
                                  onUpdateStatus: (status) {
                                    context.read<CreatorHomeBloc>().add(OnUpdateStatus(status));
                                  },
                                ),
                                16.height,
                                const ScheduleSetting(),
                                16.height,
                                if(state.recentCallFan != null)
                                  ...[
                                    RecentCall(
                                        callDurationInSec: state.recentCallFan!.totalCallTime ?? 0,
                                        fan: state.recentCallFan!),
                                    16.height
                                  ],
                                WaitingSection(
                                  fans: state.waitingFans,
                                )
                                ,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }

  Widget _indicators() {
    return Padding(
      padding: 16.paddingVertical,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          indicator(AppColors.white),
          5.width,
          indicator(AppColors.colorB0B9C0),
          5.width,
          indicator(AppColors.colorB0B9C0),
          5.width,
          indicator(AppColors.colorB0B9C0),
        ],
      ),
    );
  }

  Widget indicator(Color color) {
    return Container(
      width: 12,
      height: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(60),
      ),
    );
  }
}
