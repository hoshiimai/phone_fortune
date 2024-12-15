import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/ui/creator/main/interactor/main_creator_bloc.dart' as creator;
import 'package:callmobile/utils/app_assets.dart';
import 'package:callmobile/utils/app_shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/model/business/page_navigation.dart';
import '../../../../core/model/enum/enum_bottom_navigation_page.dart';
import '../../../../locale/locale_key.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_styles.dart';
import '../../../base/base_page.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_image.dart';
import '../../../widgets/app_single_scrollview.dart';
import '../../main/interactor/main_bloc.dart';
import '../interactor/call_bloc.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Get.find<CallBloc>()..add(const OnFetchRoomDetail()),
      child: BlocBuilder<CallBloc, CallState>(builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: AppDimensions.sideMargins.copyWith(bottom: 20),
            child: AppButton(
              height: 62,
              title: LocaleKey.rateTitleButton.tr,
              onTap: () {
                final isFan = Get.find<AppShared>().getUser()?.role == Role.fan;
                // Force to clear stack and navigate to home page
                if(isFan) {
                  Get.find<MainBloc>()
                    ..add(const OnChangeTabEvent(BottomNavigationPage.home))
                    ..add(const OnChangeTabEvent(BottomNavigationPage.home));
                } else {
                  Get.find<creator.MainCreatorBloc>()
                    ..add(const creator.OnChangeTabEvent(BottomNavigationPage.home))
                    ..add(const creator.OnChangeTabEvent(BottomNavigationPage.home));
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
                const AppImage(
                  image: AppAssets.bg_avatar_png,
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
                        '07:17',
                        style: AppStyles.fontSize12(color: AppColors.color616161),
                      ),
                    ],
                  ),
                ),
                30.height,
                Text(
                  'ナナコさんとのツーショットが\n終了しました',
                  style: AppStyles.fontSize16(fontWeight: FontWeight.w600, height: 1.5),
                  textAlign: TextAlign.center,
                ),
                30.height,
              ]),
            ),
          ),
        );
      }),
    );
  }
}
