import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/cupertino.dart' hide CupertinoTabScaffold, CupertinoTabBar;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/managers/signaling.dart';
import '../../../core/model/enum/enum_bottom_navigation_page.dart';
import '../../../core/model/enum/enum_setting.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../routing/home_router.dart';
import '../../routing/search_router.dart';
import '../../routing/setting_router.dart';
import '../../widgets/app_tab_bar.dart';
import '../../widgets/app_tab_scaffold.dart';
import 'interactor/main_bloc.dart';

class MainPage extends StatefulWidget {
  final BottomNavigationPage currentPage;
  final SettingType? settingTab;
  const MainPage({
    super.key,
    this.currentPage = BottomNavigationPage.home,
    this.settingTab,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<MainBloc>()
        ..add(OnGetUserDetail(onGetUserSuccess: (user) async {
          final bloc = Get.find<MainBloc>();
          // Handle open specific page after logged in
          if (widget.settingTab != null) {
            bloc.add(const OnChangeTabEvent(BottomNavigationPage.setting));
            await Future.delayed(const Duration(milliseconds: 200));
            if (widget.settingTab == SettingType.history) {
              // bloc.add(OnPageNavigation(
              //     pageNavigation:
              //         PageNavigation(rootPage: BottomNavigationPage.setting, childPageName: AppPages.historyPoint)));
            }
          }
        })),
      child: BlocConsumer<MainBloc, MainState>(
        listenWhen: (p, c) => p.currentPage != c.currentPage,
        listener: (context, state) {
          context.read<MainBloc>().tabController.index = fanPages.indexOf(state.currentPage);
        },
        builder: (context, state) {
          final bloc = context.read<MainBloc>();
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: CupertinoTabScaffold(
                  backgroundColor: Colors.white,
                  controller: bloc.tabController,
                  tabBar: CupertinoTabBar(
                      border: null,
                      backgroundColor: Colors.white,
                      items: [
                        _buildButtonBar(BottomNavigationPage.home),
                        _buildButtonBar(BottomNavigationPage.search),
                        _buildButtonBar(BottomNavigationPage.setting),
                      ],
                      onTap: (index) {
                        bloc.add(OnChangeTabEvent(fanPages[index]));
                      }),
                  tabBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return CupertinoTabView(
                            navigatorKey: bloc.tabNavKeys[index], onGenerateRoute: HomeRoutes.onGenerateRoute);
                      case 1:
                        return CupertinoTabView(
                            navigatorKey: bloc.tabNavKeys[index], onGenerateRoute: SearchRoutes.onGenerateRoute);
                      case 2:
                        return CupertinoTabView(
                            navigatorKey: bloc.tabNavKeys[index], onGenerateRoute: SettingRoutes.onGenerateRoute);
                      default:
                        return const CupertinoTabView();
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildButtonBar(BottomNavigationPage page) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Stack(
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  page.activeIcon,
                  height: 22,
                  width: 22,
                ),
                8.height,
                Text(
                  page.nameTab,
                  style: AppStyles.fontSize12(color: AppColors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Get.put(Signaling()).connect();
  }
}
