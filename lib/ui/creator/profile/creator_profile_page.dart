import 'dart:async';

import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/model/enum/enum_role.dart';
import '../../../core/model/response/model/user.dart';

import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';

import '../../../utils/app_pages.dart';
import '../../../utils/app_styles.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_image.dart';
import '../../widgets/base/app_dialog.dart';
import 'interactor/creator_profile_bloc.dart';

class CreatorProfilePage extends StatefulWidget {
  final User? user;
  final Creator? creator;
  const CreatorProfilePage({super.key, required this.user, this.creator});

  @override
  State<CreatorProfilePage> createState() => _CreatorProfilePageState();
}

class _CreatorProfilePageState extends State<CreatorProfilePage> {
  bool isShowMore = false;
  StreamSubscription? currentLoginUserSubscription;

  @override
  void dispose() {
    super.dispose();
    currentLoginUserSubscription?.cancel();
    Get.delete<CreatorProfileBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Get.find<CreatorProfileBloc>()..add(Init(widget.user)),
          ),
        ],
        child: BlocConsumer<CreatorProfileBloc, CreatorProfileState>(
          listener: (BuildContext context, CreatorProfileState state) {},
          builder: (BuildContext context, CreatorProfileState state) {
            const name = 'みゆき';
            const welcomeMessage = 'こんにちは！テキストが入りますテキストが入りますテキストが入りますテキストが入りますテキストが入りますテキストが入ります💓';
            const coverFilePath = AppAssets.bg_cover_png;
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
                    if (state.currentLoginUser?.role == Role.creator)
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppPages.creatorProfileEdit);
                        },
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
                          Container(
                            decoration: const BoxDecoration(
                                // image: DecorationImage(
                                //   image: AssetImage(AppAssets.bg_2_png),
                                //   fit: BoxFit.cover,
                                // ),
                                ),
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppImage(
                                      image: coverFilePath,
                                      width: Get.width,
                                      height: 177,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      color: AppColors.white,
                                      width: Get.width,
                                      child: Padding(
                                        padding: AppDimensions.sideMargins,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            90.height,
                                            Text(
                                              name,
                                              style: AppStyles.fontSize20(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.black),
                                              textAlign: TextAlign.center,
                                            ),
                                            8.height,
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                _userAvatar(state),
                              ],
                            ),
                          ),
                          Container(
                            padding: AppDimensions.sideMargins,
                            color: Colors.white,
                            child: Column(
                              children: [
                                ...[
                                  25.height,
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      welcomeMessage,
                                      style: AppStyles.fontSize12(
                                          color: AppColors.black, height: 20 / 12),
                                    ),
                                  ),
                                  110.height,
                                ]
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    if(state.currentLoginUser?.role == Role.fan)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _callCreator(state),
                      )
                  ],
                ),
              ),
            );
          },
        ));
  }

  Align _userAvatar(CreatorProfileState state) {
    const imagePath = AppAssets.bg_avatar_png;
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: 117.paddingTop,
        child: const AppImage(
          image: imagePath,
          width: 120,
          height: 120,
          radius: 100,
        ),
      ),
    );
  }

  Widget _callCreator(CreatorProfileState state) {
    Color buttonStartColor, buttonEndColor;
    final waitingFanCount = widget.creator?.waitingFanCount ?? -1;
    final isAvailable = waitingFanCount == 0;
    if (isAvailable) {
      buttonStartColor = AppColors.color35D6C8;
      buttonEndColor = AppColors.color47C66B;
    } else {
      buttonStartColor = AppColors.colorFD5C87;
      buttonEndColor = AppColors.colorFF393F;
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppDimensions.marginLeft, 0, AppDimensions.marginLeft, 10),
      child: AppButton(
        onTap: () {
          if (isAvailable) {
            showConfirmCallDialog(context, widget.creator!);
          } else {
            showWaitingDialog(context, widget.creator!);
          }
        },
        height: 62,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0),
            offset: const Offset(0, 0),
            blurRadius: 0,
          ),
        ],
        gradient: AppColors.gradientCenterHorizontal(
            startColor: buttonStartColor, endColor: buttonEndColor),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Text(
              isAvailable ? '会話する' : '順番待ち',
              style: AppStyles.fontSize20(
                  fontWeight: FontWeight.w800, height: 30 / 20, color: AppColors.white),
              textAlign: TextAlign.center,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AppImage(
                image: isAvailable ? AppAssets.ic_call_new_svg : AppAssets.ic_wait_png,
                width: 24,
                height: 24,
              ),
            )
          ],
        ),
      ),
    );
  }
}
