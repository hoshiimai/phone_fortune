import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_role.dart';
import '../../../core/model/response/model/user.dart';

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
          return PopScope(
            canPop: false,
            child: Scaffold(
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
                        text: '新規登録完了',
                        style: AppStyles.fontSize20(
                          fontWeight: FontWeight.w600,
                        ),
                        gradient: AppColors.gradient(),
                      ),
                      40.height,
                      Text( '新規登録が完了しました。\nありがとうございます！',
                          style: AppStyles.fontSize14(height: 1.6), textAlign: TextAlign.center),
                      const Spacer(),
                      AppButton(
                        onTap: () {
                          Get.until((route) => Get.currentRoute == AppPages.signIn);
                        },
                        height: 62,
                        title: 'ログインへ',
                      ),
                      16.height,
                    ],
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
