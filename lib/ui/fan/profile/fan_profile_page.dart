import 'dart:async';

import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_role.dart';
import '../../../core/model/enum/type_call.dart';
import '../../../core/model/response/model/user.dart';
import '../../../locale/locale_key.dart';

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
  final User? user;
  const FanProfilePage({
    super.key,
    required this.user,
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
            create: (context) => Get.find<FanProfileBloc>()..add(Init(widget.user)),
          ),
        ],
        child: BlocConsumer<FanProfileBloc, FanProfileState>(
          listener: (BuildContext context, FanProfileState state) {},
          builder: (BuildContext context, FanProfileState state) {
            final user = state.user;
            final currentLoginUser = state.currentLoginUser;

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
                    if (state.user == null)
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
                              _userAvatar(state),
                            ],
                          ),
                          20.height,
                          Container(
                            padding: 10.paddingAll,
                            margin: 14.paddingHorizontal,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.colorF6F6F6),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '紹介',
                                  style: AppStyles.fontSize14(
                                      color: AppColors.color020617, fontWeight: FontWeight.w700),
                                ),
                                10.height,
                                Text(
                                  'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入ります',
                                  style: AppStyles.fontSize12(
                                      color: AppColors.color020617, height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (user?.role == Role.creator && currentLoginUser?.role != Role.creator)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _callCreator(state),
                      ),
                  ],
                ),
              ),
            );
          },
        ));
  }

  Align _userAvatar(FanProfileState state) {
    const imagePath = AppAssets.bg_fan_avatar_png;
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          60.height,
          const AppImage(
            image: imagePath,
            width: 120,
            height: 120,
            radius: 100,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              16.height,
              Text(
                'AKIRAaa',
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
                      '男',
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
                      '1999 年 2 月 28 日',
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

  Widget _callCreator(FanProfileState state) {
    final typeCall = TypeCall.getTypeCall(creatorRoomLength: state.user?.creatorRoom?.length ?? 0);
    final isOnline = state.user?.isOnline ?? false;
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppDimensions.marginLeft, 0, AppDimensions.marginLeft, 10),
      child: AppButton(
        onTap: isOnline
            ? () {
                // Get.find<Signaling>().processCall(state.user!);
              }
            : null,
        height: 62,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0),
            offset: const Offset(0, 0),
            blurRadius: 0,
          ),
        ],
        gradient: isOnline ? typeCall.gradientColor : AppColors.gradientOffline(),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Text(
              isOnline ? typeCall.text : LocaleKey.callOffline.tr,
              style: AppStyles.fontSize20(
                fontWeight: FontWeight.w800,
                height: 30 / 20,
              ),
              textAlign: TextAlign.center,
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: SvgPicture.asset(
            //     isOnline ? typeCall.icon : AppAssets.ic_call_offline_svg,
            //     width: 24,
            //     height: 24,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
