import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:callmobile/ui/creator/main/interactor/main_creator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_bottom_navigation_page.dart';
import '../../../core/model/enum/enum_setting.dart';
import '../../../core/model/response/model/user.dart';
import '../../../locale/locale_key.dart';
import '../../../utils/app_appbar.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../../utils/app_shared.dart';
import '../../base/base_page.dart';
import '../../fan/main/interactor/main_bloc.dart';
import '../../widgets/common/setting_row_item.dart';
import 'component/user_info.dart';
import 'interactor/setting_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => Get.find<SettingBloc>()..add(const Init()),
        child: MultiBlocListener(
          listeners: [
            if(Get.isRegistered<MainBloc>())
              BlocListener<MainBloc, MainState>(
                listenWhen: (p, c) => p.popPage != c.popPage,
                listener: (ctx, state) {
                  if (state.popPage == BottomNavigationPage.setting) {
                    Navigator.of(context)
                        .popUntil((Route<dynamic> route) => route.settings.name == '/');
                    Get.find<MainBloc>().add(const ResetPopPage());
                  }
                },
              ),
            if(Get.isRegistered<MainCreatorBloc>())
              BlocListener<MainCreatorBloc, MainCreatorState>(
                listenWhen: (p, c) => p.popPage != c.popPage,
                listener: (ctx, state) {
                  if (state.popPage == BottomNavigationPage.setting) {
                    Navigator.of(context)
                        .popUntil((Route<dynamic> route) => route.settings.name == '/');
                    Get.find<MainCreatorBloc>().add(const ResetPopPageCreator());
                  }
                },
              ),
          ],
          child: BlocConsumer<SettingBloc, SettingState>(
            listener: (BuildContext context, SettingState state) {},
            builder: (BuildContext context, SettingState state) {
              final settings = SettingType.values.toList();
              final isCreator = Get.find<AppShared>().getUser()?.role == Role.creator;
              if(isCreator) {
                settings.removeWhere((setting) => setting == SettingType.history);
              } else {
                settings.removeWhere((setting) => setting == SettingType.personalInfo);
              }
              return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: CustomAppBar(
                  title: LocaleKey.settingTitle.tr,
                  isShowLogo: true,
                ),
                body: BasePage(
                  child: Padding(
                    padding: AppDimensions.paddingTop,
                    child: Stack(
                      children: [
                        Padding(
                          padding: 35.paddingTop,
                          child: Container(
                            color: AppColors.white,
                            child: Column(
                              children: [
                                80.height,
                                Padding(
                                  padding: AppDimensions.sideMargins,
                                  child: Column(
                                      children: settings.map((e) {
                                    return SettingRowItem(
                                      item: e,
                                      onTap: () async {
                                        if (e == SettingType.history) {
                                          Navigator.of(context).pushNamed(AppPages.historyChat);
                                        } else if (e == SettingType.settingAccount) {
                                          Navigator.of(context).pushNamed(AppPages.infoView);
                                        } else if (e == SettingType.personalInfo) {
                                          Navigator.of(context).pushNamed(AppPages.personalInfoEdit);
                                        } else if (e == SettingType.logout) {
                                          final appShared = Get.find<AppShared>();
                                          appShared.clearUserData();
                                          Get.offNamedUntil(AppPages.signIn, (route) => false);
                                        }
                                      },
                                      getIcon: (item) => item.icon,
                                      getName: (item) => item.nameLocalization,
                                    );
                                  }).toList()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        StreamBuilder<User?>(
                          initialData: Get.find<AppShared>().getUser(),
                          stream: Get.find<AppShared>().watchUser(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              return UserInfo(
                                user: snapshot.data,
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
