import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../locale/locale_key.dart';
import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../auth/pin_code/component/otp_input.dart';
import '../../base/base_page.dart';
import '../../base/interactor/page_states.dart';
import '../../widgets/app_single_scrollview.dart';
import '../../widgets/base/app_body.dart';
import 'interactor/info_bloc.dart';

class EmailVerifyPage extends StatefulWidget {
  const EmailVerifyPage({super.key});

  @override
  EmailVerifyPageState createState() {
    return EmailVerifyPageState();
  }
}

class EmailVerifyPageState extends State<EmailVerifyPage> {

  TextEditingController? codeController;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
  }

  @override
  void dispose() {
    codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InfoBloc, InfoState>(
      bloc: Get.find<InfoBloc>(),
      listenWhen: (p, c) => p.verifyEmailStatus != c.verifyEmailStatus,
      listener: (BuildContext context, InfoState state) {
        if(state.verifyEmailStatus == PageState.success && state.code.length == 4) {
          Get.find<InfoBloc>().add(const OnChangeCode(''));
          Navigator.of(context)
            ..pop()
            ..pop(true);
        }
      },
      builder: (BuildContext context, InfoState state) {
        return AppBody(
          pageState: state.verifyEmailStatus,
          success: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
                title: LocaleKey.emailChangeTitle.tr, iconLeading: AppAssets.ic_back_2_svg),
            body: BasePage(
              unFocusWhenTouchOutsideInput: true,
              child: AppSingleScrollView(
                child: Padding(
                  padding: AppDimensions.paddingTop,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: 40.borderRadiusTop,
                    ),
                    padding: AppDimensions.sideMargins,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        30.height,
                        Center(
                          child: Text(
                            LocaleKey.verifyOtp.tr,
                            textAlign: TextAlign.center,
                            style: AppStyles.fontSize16(fontWeight: FontWeight.w600, color: AppColors.black),
                          ),
                        ),
                        25.height,
                        Center(
                          child: Text(
                            LocaleKey.verifyOtpContent.tr,
                            textAlign: TextAlign.center,
                            style: AppStyles.fontSize14(color: AppColors.black),
                          ),
                        ),
                        55.height,
                        OtpInput(
                          color: AppColors.colorDEDEDE,
                          textColor: AppColors.black,
                          controller: codeController!,
                          onChanged: (value) {
                            Get.find<InfoBloc>().add(OnChangeCode(value ?? ''));
                          },
                        ),
                        55.height,
                        Center(
                          child: TextButton(
                            onPressed: () {
                              codeController?.clear();
                              Get.find<InfoBloc>().add(const OnSubmitEmail(true));
                            },
                            child: Text(
                              LocaleKey.resend.tr,
                              textAlign: TextAlign.center,
                              style: AppStyles.fontSize14(color: AppColors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
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
