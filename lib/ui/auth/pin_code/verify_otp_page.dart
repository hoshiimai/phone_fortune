import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../locale/locale_key.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../widgets/base/app_body.dart';
import 'component/otp_input.dart';
import 'interactor/verify_otp_bloc.dart';

class VerifyOtpPage extends StatefulWidget {
  final String email;
  final String fromPage;

  const VerifyOtpPage({super.key, required this.email, required this.fromPage});

  @override
  VerifyOtpPageState createState() {
    return VerifyOtpPageState();
  }
}

class VerifyOtpPageState extends State<VerifyOtpPage> {

  TextEditingController? otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<VerifyOtpBloc>()..add(Init(widget.email)),
      child: BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (BuildContext context, VerifyOtpState state) {},
        builder: (BuildContext context, VerifyOtpState state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: BasePage(
              isGradientBackground: false,
              isShowLogo: true,
              unFocusWhenTouchOutsideInput: true,
              child: AppBody(
                pageState: state.status,
                success: Padding(
                  padding: AppDimensions.sideMargins,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          LocaleKey.verifyOtp.tr,
                          textAlign: TextAlign.center,
                          style: AppStyles.fontSize16(fontWeight: FontWeight.w600, color: AppColors.colorFF7B98),
                        ),
                        25.height,
                        Text(
                          LocaleKey.verifyOtpContent.tr,
                          textAlign: TextAlign.center,
                          style: AppStyles.fontSize14(color: AppColors.color616161),
                        ),
                        55.height,
                        OtpInput(
                          controller: otpController!,
                          onChanged: (value) {
                            context.read<VerifyOtpBloc>().add(OnChangeOtp(
                                value: value ?? '',
                                onVerifySuccess: (accessToken) {
                                  if(widget.fromPage == AppPages.forgotPassword) {
                                    Get.offAndToNamed(AppPages.changePassword,
                                      arguments: {
                                        'accessToken': accessToken,
                                      },);
                                  } else if(widget.fromPage == AppPages.signUp) {
                                    Get.offAndToNamed(AppPages.registerSuccess,);
                                  }
                                }));
                          },
                        ),
                        55.height,
                        Center(
                          child: TextButton(
                            onPressed: () {
                              otpController?.clear();
                              context.read<VerifyOtpBloc>().add(const OnResendCode());
                            },
                            child: Text(
                              LocaleKey.resend.tr,
                              textAlign: TextAlign.center,
                              style: AppStyles.fontSize16(color: AppColors.color222222, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
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