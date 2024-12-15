import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_role.dart';
import '../../../core/model/response/model/user.dart';
import '../../../locale/locale_key.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../../utils/app_shared.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_gradient_text.dart';

import 'interactor/register_success_bloc.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<RegisterSuccessBloc>(),
      child: BlocConsumer<RegisterSuccessBloc, RegisterSuccessState>(
        listener: (BuildContext context, RegisterSuccessState state) {},
        builder: (BuildContext context, RegisterSuccessState state) {
          return Scaffold(
            body: BasePage(
              isGradientBackground: false,
              isShowLogo: true,
              unFocusWhenTouchOutsideInput: true,
              child: Padding(
                padding: AppDimensions.sideMargins,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    SvgPicture.asset(AppAssets.ic_check_svg),
                    20.height,
                    AppGradientText(
                      text: LocaleKey.registerSuccessTitle.tr,
                      style: AppStyles.fontSize20(
                        fontWeight: FontWeight.w600,
                      ),
                      gradient: AppColors.gradient(),
                    ),
                    40.height,
                    Text(LocaleKey.registerSuccessContent.tr,
                        style: AppStyles.fontSize14(height: 1.6), textAlign: TextAlign.center),
                    const Spacer(),
                    AppButton(
                      onTap: () {
                        Get.find<AppShared>().setUser(const User(
                            id: 10000001,
                            role: Role.fan,
                            isOnline: true,
                            initialCallTiming: 0,
                            initialCallFee: 0,
                            afterCallTiming: 0,
                            afterCallFee: 0,
                            evaluateScore: 0,
                            totalEvaluated: 0,
                            gender: 0,
                            isEmailVerified: true,
                            email: 'abc@gmail.com',
                            name: 'AKIRAaa',
                            nickname: 'AKIRAaa',
                            isDeleted: false));
                        Get.offNamedUntil(AppPages.main, (route) => false);
                      },
                      height: 62,
                      title: LocaleKey.goHome.tr,
                    ),
                    16.height,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
