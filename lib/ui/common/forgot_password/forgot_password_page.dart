import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/model/argument/verify_otp_argument.dart';

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
import 'binding/interactor/forgot_password_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
  @override
  ForgotPasswordPageState createState() {
    return ForgotPasswordPageState();
  }
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController? emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController?.dispose();
    Get.delete<ForgotPasswordBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<ForgotPasswordBloc>(),
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (BuildContext context, ForgotPasswordState state) {
          if (state.status == PageState.success) {
            Get.toNamed(AppPages.verifyOtp,
                arguments: VerifyOtpArgument(email: state.email, fromPage: AppPages.forgotPassword));
          }
        },
        builder: (BuildContext context, ForgotPasswordState state) {
          return AppBody(
            pageState: state.status,
            success: Scaffold(
              body: BasePage(
                isGradientBackground: false,
                unFocusWhenTouchOutsideInput: true,
                child: Padding(
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
                              'パスワードをお忘れの方',
                              style: AppStyles.fontSize20(fontWeight: FontWeight.w600, color: AppColors.colorFF7B98),
                            ),
                          ),
                        ),
                        4.height,
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text('メールアドレスを入力して\n「送信する」ボタンをクリックしてください',
                                style: AppStyles.fontSize14(height: 1.6),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        54.height,
                        AppTextField(
                          controller: emailController,
                          hintText: 'メールアドレス',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            context.read<ForgotPasswordBloc>().add(OnEmailChange(value));
                          },
                          errors: [state.validEmail],
                        ),
                        35.height,
                        AppButton(
                            onTap: () {
                              context.read<ForgotPasswordBloc>().add(const OnSubmit());
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
                        (Get.bottomBarHeight / 6).toInt().height,
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
