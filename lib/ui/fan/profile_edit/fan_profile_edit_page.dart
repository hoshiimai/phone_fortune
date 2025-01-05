import 'dart:io';

import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/widgets/base/app_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/managers/permission_manager.dart';
import '../../../core/model/business/gender_type.dart.dart';
import '../../../core/model/business/icon_type.dart';


import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';

import '../../../utils/app_styles.dart';
import '../../../utils/app_utils.dart';
import '../../creator/profile_edit/component/image_resource_dialog.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_image.dart';
import '../../widgets/app_radio_button_group.dart';
import '../../widgets/app_text_field.dart';
import 'interactor/fan_profile_edit_bloc.dart';

class FanProfileEditPage extends StatefulWidget {
  const FanProfileEditPage({
    super.key,
  });

  @override
  State<FanProfileEditPage> createState() => _FanProfileEditPageState();
}

class _FanProfileEditPageState extends State<FanProfileEditPage> {
  final ImagePicker picker = ImagePicker();
  TextEditingController? birthDateController;
  TextEditingController? nameController;
  TextEditingController? welcomeMessageController;

  @override
  void initState() {
    super.initState();
    birthDateController = TextEditingController();
    nameController = TextEditingController();
    welcomeMessageController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    birthDateController?.dispose();
    nameController?.dispose();
    welcomeMessageController?.dispose();
    Get.delete<FanProfileEditBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Get.find<FanProfileEditBloc>()..add(Init(onInitCompleted: (currentUser) {
              nameController?.text = currentUser.fullName ?? '';
              welcomeMessageController?.text = currentUser.welcomeMessages ?? '';
            })),
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
            return AppBody(
              pageState: state.status,
              success: Scaffold(
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
                              _userAvatar(context, state),
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
                                  controller: nameController,
                                  hintText: '名前',
                                  borderColor: AppColors.colorDEDEDE,
                                  textStyleColor: AppColors.black,
                                  onChanged: (value) {
                                    context
                                        .read<FanProfileEditBloc>()
                                        .add(OnChangeName(value));
                                  },
                                  errors: [state.validName],
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
                                      hintText: '生年月日',
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
                                24.height,
                                Text(
                                  '紹介',
                                  style: AppStyles.fontSize14(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                10.height,
                                AppTextField(
                                  controller: welcomeMessageController,
                                  hintText: '紹介',
                                  borderColor: AppColors.colorDEDEDE,
                                  textStyleColor: AppColors.black,
                                  textStyle:
                                      AppStyles.fontSize12(height: 20 / 12, color: AppColors.black),
                                  keyboardType: TextInputType.multiline,
                                  height: 72,
                                  onChanged: (value) {
                                    context
                                        .read<FanProfileEditBloc>()
                                        .add(OnChangeWelcomeMessage(value));
                                  },
                                  errors: const [],
                                ),
                                14.height,
                                Row(
                                  children: [
                                    AppButton(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        context
                                            .read<FanProfileEditBloc>()
                                            .add(OnUpdateProfile(onUpdateProfileSuccess: () {
                                              Navigator.of(context).pop();
                                        }));
                                      },
                                      width: (Get.width - 50 - 14) / 2,
                                      height: 55,
                                      title: '登録する',
                                    ),
                                    14.width,
                                    AppButton(
                                      onTap: () => Navigator.of(context).pop(),
                                      backgroundColor: AppColors.color9B9B9B,
                                      width: (Get.width - 50 - 14) / 2,
                                      height: 55,
                                      title: 'キャンセル',
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
                  ],
                ),
              ),
            );
          },
        ));
  }

  Align _userAvatar(BuildContext context, FanProfileEditState state) {
    final imagePath = state.avatar?.path ?? state.currentLoginUser?.getAvatarPath() ?? AppAssets.ic_avatar_default_svg;
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          60.height,
          Stack(
            children: [
              AppImage(
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
                    onPressed: () {
                      _showImageResource(context);
                    },
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

  _showImageResource(BuildContext context) {
    Get.dialog(
      ImageResourceDialog(
        onConfirmPressed: (imageResource) async {
          final permission = imageResource == ImageSource.camera ? Permission.camera : Permission.photos;
          final type = imageResource == ImageSource.camera ? PermissionType.camera : PermissionType.photos;
          final isGranted = (Platform.isAndroid && imageResource == ImageSource.gallery)
              ? true
              : await PermissionManager().checkPermission(permission, type);
          if(isGranted) {
            final XFile? image = await picker.pickImage(source: imageResource);
            if(image?.path.isNotEmpty ?? false) {
              if(context.mounted) {
                context.read<FanProfileEditBloc>().add(OnAvatarSelected(File(image?.path ?? '')));
              }
            }
          }
        },
      ),
      barrierDismissible: true,
    );
  }
}
