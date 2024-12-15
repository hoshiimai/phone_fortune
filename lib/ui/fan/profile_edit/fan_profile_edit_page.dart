import 'dart:async';

import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/model/business/gender_type.dart.dart';
import '../../../core/model/business/icon_type.dart';
import '../../../core/model/enum/enum_role.dart';
import '../../../core/model/enum/type_call.dart';
import '../../../core/model/response/model/user.dart';
import '../../../locale/locale_key.dart';

import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';

import '../../../utils/app_styles.dart';
import '../../../utils/app_utils.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_image.dart';
import '../../widgets/app_radio_button_group.dart';
import '../../widgets/app_text_field.dart';
import 'interactor/fan_profile_edit_bloc.dart';

class FanProfileEditPage extends StatefulWidget {
  final User? user;

  const FanProfileEditPage({
    super.key,
    required this.user,
  });

  @override
  State<FanProfileEditPage> createState() => _FanProfileEditPageState();
}

class _FanProfileEditPageState extends State<FanProfileEditPage> {
  bool isShowMore = false;
  StreamSubscription? currentLoginUserSubscription;
  TextEditingController? birthDateController;

  @override
  void initState() {
    super.initState();
    birthDateController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    currentLoginUserSubscription?.cancel();
    birthDateController?.dispose();
    Get.delete<FanProfileEditBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Get.find<FanProfileEditBloc>()..add(Init(widget.user)),
          ),
        ],
        child: BlocConsumer<FanProfileEditBloc, FanProfileEditState>(
          listenWhen: (previous, current) => previous.birthDate != current.birthDate,
          listener: (BuildContext context, FanProfileEditState state) {
            birthDateController?.text = state.birthDate != null
                ? AppUtils.formatDate(state.birthDate!, format: AppUtils.yyyyMMdd)
                : '';
          },
          builder: (BuildContext context, FanProfileEditState state) {
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
                            padding: 24.paddingAll,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '名前',
                                  style: AppStyles.fontSize14(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                10.height,
                                AppTextField(
                                  hintText: LocaleKey.name.tr,
                                  borderColor: AppColors.colorDEDEDE,
                                  textStyleColor: AppColors.black,
                                  onChanged: (value) {},
                                  errors: const [],
                                ),
                                24.height,
                                Text(
                                  '性別',
                                  style: AppStyles.fontSize14(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                10.height,
                                AppRadioButtonGroup(
                                  direction: Axis.horizontal,
                                  gradient: AppColors.gradient(
                                      begin: Alignment.centerLeft, end: Alignment.centerRight),
                                  height: 50,
                                  options: const [
                                    //TODO: handle multi language
                                    '男性',
                                    '女性',
                                    '他の'
                                  ],
                                  selectedOption: state.gender?.description(),
                                  onChanged: (String? value) {
                                    if (value?.isNotEmpty ?? false) {
                                      final gender = GenderType.fromDescription(value!);
                                      context
                                          .read<FanProfileEditBloc>()
                                          .add(OnChangeGender(gender));
                                    }
                                  },
                                ),
                                24.height,
                                Text(
                                  '生年月日',
                                  style: AppStyles.fontSize14(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                10.height,
                                Stack(
                                  children: [
                                    AppTextField(
                                      iconType: IconType.calendar,
                                      padding: 22.paddingHorizontal.copyWith(top: 14),
                                      controller: birthDateController,
                                      hintText: LocaleKey.hintDateOfBirth.tr,
                                      errors: [state.validBirthDate],
                                      borderColor: AppColors.colorDEDEDE,
                                    ),
                                    Positioned.fill(
                                        child: GestureDetector(
                                            onTap: () async {
                                              FocusScope.of(context).requestFocus(FocusNode());
                                              final selectedDate = await showDatePicker(
                                                context: context,
                                                initialDate: state.birthDate ?? DateTime.now(),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime.now(),
                                              );
                                              if (selectedDate != null) {
                                                if (context.mounted) {
                                                  context
                                                      .read<FanProfileEditBloc>()
                                                      .add(OnChangeBirthDate(selectedDate));
                                                }
                                              }
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                            )))
                                  ],
                                ),
                                Text(
                                  LocaleKey.bioTitle.tr,
                                  style: AppStyles.fontSize14(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                10.height,
                                AppTextField(
                                  hintText: LocaleKey.bioTitle.tr,
                                  borderColor: AppColors.colorDEDEDE,
                                  textStyleColor: AppColors.black,
                                  textStyle:
                                      AppStyles.fontSize12(height: 20 / 12, color: AppColors.black),
                                  keyboardType: TextInputType.multiline,
                                  height: 72,
                                  onChanged: (value) {},
                                  errors: const [],
                                ),
                                14.height,
                                Row(
                                  children: [
                                    AppButton(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        Navigator.of(context).pop();
                                      },
                                      width: (Get.width - 50 - 14) / 2,
                                      height: 55,
                                      title: LocaleKey.register.tr,
                                    ),
                                    14.width,
                                    AppButton(
                                      onTap: () => Navigator.of(context).pop(),
                                      backgroundColor: AppColors.color9B9B9B,
                                      width: (Get.width - 50 - 14) / 2,
                                      height: 55,
                                      title: LocaleKey.cancel.tr,
                                    )
                                  ],
                                ),
                                14.height,
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

  Align _userAvatar(FanProfileEditState state) {
    const imagePath = AppAssets.bg_fan_avatar_png;
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          60.height,
          Stack(
            children: [
              const AppImage(
                image: imagePath,
                width: 120,
                height: 120,
                radius: 100,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    splashRadius: 24,
                    icon: SvgPicture.asset(AppAssets.ic_edit_svg),
                  ),
                ),
              )
            ],
          ),
          20.height,
        ],
      ),
    );
  }

  Widget _callCreator(FanProfileEditState state) {
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
          ],
        ),
      ),
    );
  }
}
