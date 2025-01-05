import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../base/interactor/page_states.dart';
import '../../widgets/app_single_scrollview.dart';
import '../../widgets/base/app_body.dart';
import '../pin_code/component/otp_input.dart';
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
            appBar: const CustomAppBar(
                title: 'メールアドレス編集', iconLeading: AppAssets.ic_back_2_svg),
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
                            '認証コードを入力してください',
                            textAlign: TextAlign.center,
                            style: AppStyles.fontSize16(fontWeight: FontWeight.w600, color: AppColors.black),
                          ),
                        ),
                        25.height,
                        Center(
                          child: Text(
                            'メールアドレスに送信した認証コードを\n入力してください',
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
                              'メールを再送する',
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
