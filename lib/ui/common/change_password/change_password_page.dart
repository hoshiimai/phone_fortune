import 'package:callmobile/core/model/business/icon_type.dart';
import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../base/interactor/page_states.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_single_scrollview.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/base/app_body.dart';
import '../../widgets/base/app_dialog.dart';
import 'binding/interactor/change_password_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  final String accessToken;

  const ChangePasswordPage({super.key, required this.accessToken});

  @override
  ChangePasswordPageState createState() {
    return ChangePasswordPageState();
  }
}

class ChangePasswordPageState extends State<ChangePasswordPage> {

  TextEditingController? passwordController;
  TextEditingController? confirmPasswordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    passwordController?.dispose();
    confirmPasswordController?.dispose();
    Get.delete<ChangePasswordBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<ChangePasswordBloc>()..add(Init(widget.accessToken)),
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listenWhen: (p, c) => p.status != c.status,
        listener: (BuildContext context, ChangePasswordState state) {
          if(state.status == PageState.success) {
            showSuccessDialog(
                title: 'パスワード再設定完了',
                message:'新しいパスワードに変更されました。',
                textConfirm: 'ログインへ',
                onConfirmPressed: () {
                  Get.until((route) => Get.currentRoute == AppPages.signIn);
                });
          }
        },
        builder: (BuildContext context, ChangePasswordState state) {
          return Scaffold(
            body: BasePage(
              isGradientBackground: false,
              unFocusWhenTouchOutsideInput: true,
              child: AppBody(
                pageState: state.status,
                success: Padding(
                  padding: AppDimensions.sideMargins,
                  child: AppSingleScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        180.height,
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'パスワード再設定',
                              style: AppStyles.fontSize20(fontWeight: FontWeight.w600, color: AppColors.colorFF7B98),
                            ),
                          ),
                        ),
                        54.height,
                        AppTextField(
                          padding: 22.paddingHorizontal.copyWith(top: 14),
                          hintText: 'パスワード',
                          isPassword: true,
                          iconType: IconType.password,
                          onChanged: (value) {
                            context.read<ChangePasswordBloc>().add(OnPasswordChange(value));
                          },
                          errors: [state.validPassword],
                        ),
                        10.height,
                        AppTextField(
                          padding: 22.paddingHorizontal.copyWith(top: 14),
                          hintText: 'パスワード（確認用）',
                          isPassword: true,
                          iconType: IconType.password,
                          onChanged: (value) {
                            context.read<ChangePasswordBloc>().add(OnConfirmPasswordChanged(value));
                          },
                          errors: [state.validConfirmPassword],
                        ),
                        35.height,
                        AppButton(
                            onTap: () {
                              context.read<ChangePasswordBloc>().add(const OnSubmit());
                            },
                            height: 62,
                            title: '送信する',),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(AppAssets.ic_back_svg),
                              5.width,
                              Text(
                                '戻る',
                                style: AppStyles.fontSize16(fontWeight: FontWeight.w600, color: AppColors.colorFF7B98),
                              ),
                            ],
                          ),
                        ),
                        20.height,
                      ],
                    ),
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
