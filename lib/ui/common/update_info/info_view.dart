import 'dart:async';

import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../../utils/app_shared.dart';
import '../../base/base_page.dart';
import '../../widgets/base/app_dialog.dart';
import 'component/item_info.dart';
import 'interactor/info_bloc.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  InfoViewState createState() {
    return InfoViewState();
  }
}

class InfoViewState extends State<InfoView> {
  StreamSubscription? _userSubscription;
  InfoBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = Get.find<InfoBloc>()..add(const Init());
    _userSubscription = Get.find<AppShared>().watchUser().listen((user) {
      if (user != null) {
        _bloc?.add(OnUpdateUser(user));
      }
    });
  }

  @override
  void dispose() {
    _bloc?.close();
    Get.delete<InfoBloc>();
    _userSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc!,
      child: BlocConsumer<InfoBloc, InfoState>(
        listener: (BuildContext context, InfoState state) {},
        builder: (BuildContext context, InfoState state) {
          final user = state.user;
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: const CustomAppBar(
                title: 'ID&パスワード', iconLeading: AppAssets.ic_back_2_svg),
            body: BasePage(
              child: Padding(
                padding: AppDimensions.paddingTop,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: 40.borderRadiusTop,
                  ),
                  padding: AppDimensions.sideMargins,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.height,
                      ItemInfo(title: 'ユーザーID', data: user?.id.toString() ?? ''),
                      20.height,
                      ItemInfo(
                        title: 'メールアドレス',
                        data: user?.email ?? '',
                        showIcon: user?.snsId?.isEmpty ?? true,
                        onTap: user?.snsId?.isEmpty ?? true
                            ? () async {
                                final isChangeEmailSuccess =
                                    await Navigator.of(context).pushNamed(AppPages.emailEdit);
                                if (isChangeEmailSuccess == true) {
                                  if (!context.mounted) {
                                    return;
                                  }
                                  showUpdateSuccessDialog(context, 'メールアドレスを変更しました');
                                }
                              }
                            : null,
                      ),
                      20.height,
                      ItemInfo(
                        title: 'パスワード',
                        data: '********',
                        showIcon: user?.snsId?.isEmpty ?? true,
                        onTap: user?.snsId?.isEmpty ?? true
                            ? () {
                                Navigator.of(context).pushNamed(AppPages.passwordEdit);
                              }
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
