import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_bottom_navigation_page.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../widgets/base/app_body.dart';
import '../main/interactor/main_bloc.dart';
import '../../widgets/common/home_appbar.dart';
import 'component/top_banner.dart';
import 'component/top_guideline.dart';
import 'component/top_ranking.dart';
import 'component/top_summary.dart';
import 'interactor/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          // Pop page listener
          BlocListener<MainBloc, MainState>(
            bloc: Get.find<MainBloc>(),
            listenWhen: (p, c) => p.popPage != c.popPage,
            listener: (ctx, state) {
              if (state.popPage == BottomNavigationPage.home) {
                Get.until((route) => Get.currentRoute == AppPages.main);
                Navigator.of(context).popUntil((Route<dynamic> route) => route.settings.name == '/');
                Get.find<MainBloc>().add(const ResetPopPage());
              }
            },
          ),
        ],
        child: BlocProvider(
          create: (context) => Get.find<HomeBloc>()..add(const Init(isRefresh: false)),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (BuildContext context, HomeState state) {},
            builder: (BuildContext context, HomeState state) {
              final currentUser = state.currentLoggedInUser;
              final padding = MediaQuery.of(context).padding.top;
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: HomeAppbar(
                  title: 'ホーム',
                  isShowLogo: true,
                  height: 98,
                  actions: [
                    Container(
                      height: 28,
                      margin: const EdgeInsets.only(right: 10),
                      padding: 6.paddingAll,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.colorF2F2F2),
                          borderRadius: BorderRadius.circular(60),
                          gradient: AppColors.gradientPoint()),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            AppAssets.ic_coin_png,
                            width: 20,
                            height: 20,
                          ),
                          2.width,
                          Text(
                            '${state.currentLoggedInUser?.pointBalance ?? 0} Points',
                            style: AppStyles.fontSize10(color: AppColors.colorFF7B98, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                body: BasePage(
                  isBackground: false,
                  child: Padding(
                    padding: EdgeInsets.only(top: 98 + padding - 10),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<HomeBloc>().add(const Init(isRefresh: true));
                        await Future<void>.delayed(const Duration(milliseconds: 500));
                      },
                      child: SingleChildScrollView(
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: Get.width,
                            minHeight: Get.height,
                          ),
                          color: AppColors.colorFAFAFA,
                          padding: AppDimensions.sideMargins,
                          child: AppBody(
                            pageState: state.status,
                            success: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const TopBanner(),
                                _indicators(),
                                TopSummary(user: currentUser),
                                16.height,
                                const TopGuideline(),
                                16.height,
                                TopRanking(creators: state.creators,),
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
