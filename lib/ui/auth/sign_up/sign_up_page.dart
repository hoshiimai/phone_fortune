import 'package:callmobile/core/model/business/gender_type.dart.dart';
import 'package:callmobile/extensions/int_extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/model/business/icon_type.dart';
import '../../../locale/locale_key.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/app_utils.dart';
import '../../base/base_page.dart';
import '../../base/interactor/page_states.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_radio_button_group.dart';
import '../../widgets/app_single_scrollview.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/base/app_body.dart';
import 'binding/interactor/sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() {
    return SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController? userNameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? birthDateController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    birthDateController = TextEditingController();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    userNameController?.dispose();
    birthDateController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<SignUpBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<SignUpBloc, SignUpState>(
            listenWhen: (previous, current) => previous.status != current.status,
            listener: (BuildContext context, SignUpState state) {
              if (state.status == PageState.success) {
                Get.toNamed(AppPages.verifyOtp,
                    arguments: {'email': state.email, 'fromPage': AppPages.signUp});
              }
            },
          ),
          BlocListener<SignUpBloc, SignUpState>(
            listenWhen: (previous, current) => previous.birthDate != current.birthDate,
            listener: (BuildContext context, SignUpState state) {
              birthDateController?.text = state.birthDate != null
                  ? AppUtils.formatDate(state.birthDate!, format: AppUtils.yyyyMMdd)
                  : '';
            },
          )
        ],
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (BuildContext context, SignUpState state) {
            return Scaffold(
              body: BasePage(
                isGradientBackground: false,
                isShowLogo: true,
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
                            child: Text(
                              LocaleKey.registerTitle.tr,
                              style: AppStyles.fontSize16(
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorFF7B98,
                              ),
                            ),
                          ),
                          30.height,
                          AppTextField(
                            controller: userNameController,
                            hintText: LocaleKey.name.tr,
                            onChanged: (value) {
                              context.read<SignUpBloc>().add(OnNameChange(value));
                            },
                            errors: [state.validName],
                          ),
                          10.height,
                          AppRadioButtonGroup(
                            direction: Axis.horizontal,
                            gradient: AppColors.gradientSwitchSelected(),
                            options: const [
                              //TODO: handle multi language
                              '男性',
                              '女性',
                              '他の'
                            ],
                            selectedOption: state.gender.description(),
                            onChanged: (String? value) {
                              if (value?.isNotEmpty ?? false) {
                                final gender = GenderType.fromDescription(value!);
                                context.read<SignUpBloc>().add(OnChangeGender(gender));
                              }
                            },
                          ),
                          24.height,
                          Stack(
                            children: [
                              AppTextField(
                                iconType: IconType.calendar,
                                padding: 22.paddingHorizontal.copyWith(top: 14),
                                controller: birthDateController,
                                hintText: LocaleKey.hintDateOfBirth.tr,
                                errors: [state.validBirthDate],
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
                                                .read<SignUpBloc>()
                                                .add(OnChangeBirthDate(selectedDate));
                                          }
                                        }
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                      )))
                            ],
                          ),
                          10.height,
                          AppTextField(
                            controller: emailController,
                            hintText: LocaleKey.emailHint.tr,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              context.read<SignUpBloc>().add(OnEmailChange(value));
                            },
                            errors: [state.validEmail],
                          ),
                          10.height,
                          AppTextField(
                            controller: passwordController,
                            hintText: LocaleKey.passwordSignUpHint.tr,
                            padding: 22.paddingHorizontal.copyWith(top: 14),
                            isPassword: true,
                            iconType: IconType.password,
                            onChanged: (value) {
                              context.read<SignUpBloc>().add(OnPasswordChange(value));
                            },
                            errors: [state.validPassword],
                          ),
                          26.height,
                          AppButton(
                              onTap: () {
                                context.read<SignUpBloc>().add(const OnRegister());
                              },
                              height: 62,
                              title: LocaleKey.registerTitle.tr),
                          const Spacer(),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                LocaleKey.thisLogin.tr,
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
      ),
    );
  }
}
