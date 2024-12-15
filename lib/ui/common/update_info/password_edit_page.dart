import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/password_type.dart';
import '../../../locale/locale_key.dart';
import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_single_scrollview.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/base/app_body.dart';
import 'interactor/info_bloc.dart';

class PasswordEditPage extends StatefulWidget {
  const PasswordEditPage({super.key});
  @override
  PasswordEditPageState createState() {
   return PasswordEditPageState();
  }
}

class PasswordEditPageState extends State<PasswordEditPage> {

  TextEditingController? currentController, newPassController, confirmPassController;

  @override
  void initState() {
    super.initState();
    currentController = TextEditingController();
    newPassController = TextEditingController();
    confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    currentController?.dispose();
    newPassController?.dispose();
    confirmPassController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InfoBloc, InfoState>(
      bloc: Get.find<InfoBloc>(),
      listener: (BuildContext context, InfoState state) {},
      builder: (BuildContext context, InfoState state) {
        return AppBody(
          pageState: state.status,
          success: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
                title: LocaleKey.passwordChangeTitle.tr, iconLeading: AppAssets.ic_back_2_svg),
            body: BasePage(
              unFocusWhenTouchOutsideInput: true,
              child: Padding(
                padding: AppDimensions.paddingTop,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: 40.borderRadiusTop,
                  ),
                  padding: AppDimensions.allMargins,
                  child: AppSingleScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        24.height,
                        Text(
                          LocaleKey.changePassWordCurrent.tr,
                          style: AppStyles.fontSize14(
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                            color: AppColors.black,
                          ),
                        ),
                        15.height,
                        AppTextField(
                          hintText: LocaleKey.changePassWordCurrent.tr,
                          padding: 22.paddingHorizontal,
                          isPassword: true,
                          borderColor: AppColors.colorDEDEDE,
                          textStyleColor: AppColors.black,
                          controller: currentController,
                          onChanged: (value) {
                            Get.find<InfoBloc>().add(OnPasswordChange(PasswordType.current, value));
                          },
                          errors: [state.validCurrentPass],
                        ),
                        33.height,
                        Text(
                          LocaleKey.changePassWordNew.tr,
                          style: AppStyles.fontSize14(
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                            color: AppColors.black,
                          ),
                        ),
                        15.height,
                        AppTextField(
                          controller: newPassController,
                          hintText: LocaleKey.changePassWordNew.tr,
                          padding: 22.paddingHorizontal,
                          isPassword: true,
                          borderColor: AppColors.colorDEDEDE,
                          textStyleColor: AppColors.black,
                          onChanged: (value) {
                            Get.find<InfoBloc>().add(OnPasswordChange(PasswordType.newPass, value));
                          },
                          errors: [state.validNewPass],
                        ),
                        15.height,
                        Text(
                          LocaleKey.changePassWordNewConfirm.tr,
                          style: AppStyles.fontSize14(
                            fontWeight: FontWeight.w600,
                            height: 21 / 14,
                            color: AppColors.black,
                          ),
                        ),
                        15.height,
                        AppTextField(
                          controller: confirmPassController,
                          hintText: LocaleKey.changePassWordNewConfirm.tr,
                          padding: 22.paddingHorizontal,
                          isPassword: true,
                          borderColor: AppColors.colorDEDEDE,
                          textStyleColor: AppColors.black,
                          onChanged: (value) {
                            Get.find<InfoBloc>().add(OnPasswordChange(PasswordType.confirmPass, value));
                          },
                          errors: [state.validConfirmPass],
                        ),
                        67.height,
                        Row(children: [
                          AppButton(
                            onTap: () {
                              onUpdatePasswordSuccess () {
                                Navigator.of(context).pop();
                              }
                              Get.find<InfoBloc>().add(OnSubmitPassword(onUpdatePasswordSuccess: onUpdatePasswordSuccess));
                            },
                            width: (Get.width - 50) / 2,
                            height: 55,
                            title: LocaleKey.register.tr,
                          ),
                          const Spacer(),
                          AppButton(
                            onTap: () => Navigator.of(context).pop(),
                            backgroundColor: AppColors.color9B9B9B,
                            width: (Get.width - 50) / 2,
                            height: 55,
                            title: LocaleKey.cancel.tr,
                          )
                        ])
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
