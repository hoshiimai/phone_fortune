import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:callmobile/ui/base/base_page.dart';
import 'package:callmobile/ui/widgets/app_button.dart';
import 'package:callmobile/ui/widgets/app_single_scrollview.dart';
import 'package:callmobile/ui/widgets/app_text_field.dart';
import 'package:callmobile/ui/widgets/base/app_body.dart';
import 'package:callmobile/utils/app_dimensions.dart';
import 'package:callmobile/utils/app_pages.dart';
import 'package:callmobile/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/model/business/icon_type.dart';
import 'interactor/sign_in_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  SignInPageState createState() {
    return SignInPageState();
  }
}

class SignInPageState extends State<SignInPage> {
  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    Get.delete<SignInBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<SignInBloc>(),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (BuildContext context, SignInState state) {},
        builder: (BuildContext context, SignInState state) {
          final bloc = Get.find<SignInBloc>();
          return Scaffold(
            body: BasePage(
              isShowLogo: true,
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
                        220.height,
                        AppTextField(
                          controller: emailController,
                          hintText: 'メールアドレス',
                          onChanged: (value) {
                            bloc.add(OnEmailChange(value));
                          },
                          keyboardType: TextInputType.emailAddress,
                          errors: [state.validEmail],
                        ),
                        10.height,
                        AppTextField(
                          controller: passwordController,
                          padding: 22.paddingHorizontal.copyWith(top: 14),
                          hintText: 'パスワード',
                          isPassword: true,
                          iconType: IconType.password,
                          onChanged: (value) {
                            bloc.add(OnPasswordChange(value));
                          },
                          errors: [state.validPassword],
                        ),
                        35.height,
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppPages.forgotPassword);
                            },
                            child: Text(
                              'パスワードをお忘れの方',
                              style: AppStyles.fontSize16(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        35.height,
                        AppButton(
                            onTap: () {
                              bloc.add(OnLogin(onLoginSuccess: (pageName) {
                                Get.offNamedUntil(pageName, (route) => false);
                              }));
                            },
                            height: 62,
                            title: 'ログイン'),

                        const Spacer(),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppPages.signUp);
                            },
                            child: Text(
                              '新規登録はこちら',
                              style: AppStyles.fontSize14(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
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
