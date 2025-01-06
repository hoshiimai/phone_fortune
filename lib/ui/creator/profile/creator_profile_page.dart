import 'dart:async';

import 'package:callmobile/core/model/business/creator_status.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/managers/signaling.dart';
import '../../../core/model/enum/enum_role.dart';
import '../../../core/model/response/model/user.dart';

import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';

import '../../../utils/app_pages.dart';
import '../../../utils/app_styles.dart';
import '../../fan/home/interactor/home_bloc.dart' as home;
import '../../widgets/app_button.dart';
import '../../widgets/app_image.dart';
import '../../widgets/base/app_dialog.dart';
import 'interactor/creator_profile_bloc.dart';

import 'package:flutter_html/flutter_html.dart';

class CreatorProfilePage extends StatefulWidget {
  final User? creator;

  const CreatorProfilePage({super.key, this.creator});

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
            create: (context) => Get.find<CreatorProfileBloc>()..add(Init(widget.creator)),
          ),
        ],
        child: BlocConsumer<CreatorProfileBloc, CreatorProfileState>(
          listener: (BuildContext context, CreatorProfileState state) {},
          builder: (BuildContext context, CreatorProfileState state) {
            if(state.creator == null) {
              return const SizedBox.shrink();
            }
            final creator = state.creator!;
            final name = creator.fullName ?? '';
            // final welcomeMessage = creator.welcomeMessages ?? '';
            const welcomeMessage = '''
              <div style="color: #333; font-family: Arial, sans-serif;">
                <h2 style="color: #2196F3; font-size: 18px;">プロフィール</h2>
                <p style="margin-bottom: 15px;">
                  こんにちは！私のプロフィールへようこそ。
                </p>
                <ul style="list-style-type: none; padding-left: 0;">
                  <li style="margin-bottom: 8px;">🎵 好きな音楽: J-POP</li>
                  <li style="margin-bottom: 8px;">📚 趣味: 読書、写真撮影</li>
                  <li style="margin-bottom: 8px;">✨ 特技: ピアノ演奏</li>
                </ul>
                <p style="color: #666; font-style: italic;">
                  一緒に楽しい時間を過ごしましょう！
                </p>
              </div>
            ''';            
            final coverFilePath = creator.getCoverPath();
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
                                    coverFilePath?.isNotEmpty ?? false
                                        ? AppImage(
                                            image: coverFilePath!,
                                            width: Get.width,
                                            height: 177,
                                            fit: BoxFit.cover,
                                          )
                                        : Container(
                                            width: Get.width,
                                            height: 177,
                                            decoration: BoxDecoration(
                                              gradient: AppColors.gradient(
                                                  begin: Alignment.centerLeft, end: Alignment.centerRight),
                                            ),
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
                                                  fontWeight: FontWeight.w600, color: AppColors.black),
                                              textAlign: TextAlign.center,
                                            ),
                                            8.height,
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                _userAvatar(creator),
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
                                  // Align(
                                  //   alignment: Alignment.topLeft,
                                  //   child: Text(
                                  //     welcomeMessage,
                                  //     style: AppStyles.fontSize12(color: AppColors.black, height: 20 / 12),
                                  //   ),
                                  // ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Html(
                                      data: welcomeMessage,
                                      style: {
                                        "body": Style(
                                          fontSize: FontSize(12),
                                          color: AppColors.black,
                                          lineHeight: LineHeight.number(1.67), // 20/12
                                        ),
                                      },
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
                    if (state.currentLoginUser?.role == Role.fan)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _callCreator(context, creator),
                      )
                  ],
                ),
              ),
            );
          },
        ));
  }

  Align _userAvatar(User creator) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: 117.paddingTop,
        child: AppImage(
          image: creator.getAvatarPath(),
          width: 120,
          height: 120,
          radius: 100,
        ),
      ),
    );
  }

  Widget _callCreator(BuildContext context, User creator) {
    Color buttonStartColor, buttonEndColor;
    final isAbleToCall = !creator.isCalling && creator.status == Status.online && creator.waitingCount == 0;
    if (isAbleToCall) {
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
          if(isAbleToCall) {
            Get.find<Signaling>().processCall(creator);
          } else {
            showWaitingDialog(context, creator, () {
              Get.back();
              context.read<CreatorProfileBloc>().add(OnRegisterCall(creatorId: creator.id, onRegisterSuccess: () {
                context.read<CreatorProfileBloc>().add(OnGetCreatorDetail(creatorId: creator.id));
                Get.find<home.HomeBloc>().add(const home.OnGetListIdol(isRefresh: true));
              }));
            });
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
        gradient: AppColors.gradientCenterHorizontal(startColor: buttonStartColor, endColor: buttonEndColor),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Text(
              isAbleToCall ? '会話する' : '順番待ち',
              style: AppStyles.fontSize20(fontWeight: FontWeight.w800, height: 30 / 20, color: AppColors.white),
              textAlign: TextAlign.center,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AppImage(
                image: isAbleToCall ? AppAssets.ic_call_new_svg : AppAssets.ic_wait_png,
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
