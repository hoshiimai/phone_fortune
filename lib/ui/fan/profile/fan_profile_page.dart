import 'dart:async';

import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_role.dart';
import '../../../core/model/enum/type_call.dart';
import '../../../core/model/response/model/user.dart';


import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../../utils/app_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_image.dart';
import 'interactor/fan_profile_bloc.dart';

class FanProfilePage extends StatefulWidget {
  const FanProfilePage({
    super.key,
  });

  @override
  State<FanProfilePage> createState() => _FanProfilePageState();
}

class _FanProfilePageState extends State<FanProfilePage> {
  bool isShowMore = false;
  StreamSubscription? currentLoginUserSubscription;

  @override
  void dispose() {
    super.dispose();
    currentLoginUserSubscription?.cancel();
    Get.delete<FanProfileBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Get.find<FanProfileBloc>()..add(const Init()),
          ),
        ],
        child: BlocConsumer<FanProfileBloc, FanProfileState>(
          listener: (BuildContext context, FanProfileState state) {},
          builder: (BuildContext context, FanProfileState state) {
            final currentUser = state.currentLoginUser;
            if(currentUser == null) {
              return const SizedBox.shrink();
            }
            return GestureDetector(
              onTap: () {
                setState(() => isShowMore = false);
              },
              child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: CustomAppBar(
                  onBack: () {
                    Navigator.of(context).pop();
                  },
                  implyLeading: true,
                  iconLeading: AppAssets.ic_back_2_svg,
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pushNamed(AppPages.fanProfileEdit),
                      splashRadius: 24,
                      icon: SvgPicture.asset(AppAssets.ic_edit_svg),
                    )
                  ],
                ),
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      gradient: AppColors.gradient(
                                          begin: Alignment.centerLeft, end: Alignment.centerRight),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                ),
                              ),
                              _userAvatar(currentUser),
                            ],
                          ),
                          20.height,
                          if (currentUser.welcomeMessages?.isNotEmpty ?? false)
                            Container(
                              padding: 10.paddingAll,
                              margin: 14.paddingHorizontal,
                              width: double.infinity,
                              decoration:
                                  BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.colorF6F6F6),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '紹介',
                                    style:
                                        AppStyles.fontSize14(color: AppColors.color020617, fontWeight: FontWeight.w700),
                                  ),
                                  10.height,
                                  Text(
                                    currentUser.welcomeMessages!,
                                    style: AppStyles.fontSize12(color: AppColors.color020617, height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
  Align _userAvatar(User currentUser) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          60.height,
          AppImage(
            image: currentUser.getAvatarPath(),
            width: 120,
            height: 120,
            radius: 100,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              16.height,
              Text(
                currentUser.fullName ?? '',
                style: AppStyles.fontSize20(fontWeight: FontWeight.w600, color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              10.height,
              Container(
                height: 28,
                padding: 12.paddingHorizontal.copyWith(top: 4, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60), color: AppColors.colorF6F6F6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      GenderType.fromInt(currentUser.gender!).shortDescription(),
                      style: AppStyles.fontSize12(color: AppColors.color616161),
                    ),
                    10.width,
                    Container(
                      width: 1,
                      height: 16,
                      color: Colors.grey,
                    ),
                    10.width,
                    Text(
                      AppUtils.formatDate(AppUtils.convertToDate(currentUser.birthdate!), format: 'yyyy 年 MM 月 dd 日'),
                      style: AppStyles.fontSize12(color: AppColors.color616161),
                    ),
                  ],
                ),
              ),
            ],
          ),
          20.height,
        ],
      ),
    );
  }
}
