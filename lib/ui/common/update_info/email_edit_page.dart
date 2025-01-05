import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_pages.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';
import '../../base/interactor/page_states.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/base/app_body.dart';
import 'interactor/info_bloc.dart';

class EmailEditPage extends StatefulWidget {

  const EmailEditPage({super.key});
  @override
  EmailEditPageState createState() {
    return EmailEditPageState();
  }

}

class EmailEditPageState extends State<EmailEditPage> {

  TextEditingController? emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailController?.text = Get.find<InfoBloc>().state.user?.email ?? '';
  }

  @override
  void dispose() {
    emailController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InfoBloc, InfoState>(
      bloc: Get.find<InfoBloc>(),
      listenWhen: (p, c) => p.status != c.status,
      listener: (BuildContext context, InfoState state) async  {
        if(state.status == PageState.success) {
          Navigator.of(context).pushNamed(AppPages.emailVerify);
        }
      },
      builder: (BuildContext context, InfoState state) {
        return AppBody(
          pageState: state.status,
          success: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
                title: 'メールアドレス編集', iconLeading: AppAssets.ic_back_2_svg),
            body: BasePage(
              unFocusWhenTouchOutsideInput: true,
              child: Padding(
                padding: AppDimensions.paddingTop,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: 40.borderRadiusTop,
                  ),
                  padding: AppDimensions.sideMargins,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      30.height,
                      Text(
                        'メールアドレス',
                        style: AppStyles.fontSize14(
                          fontWeight: FontWeight.w600,
                          height: 21 / 14,
                          color: AppColors.black,
                        ),
                      ),
                      15.height,
                      AppTextField(
                        hintText: 'メールアドレス',
                        borderColor: AppColors.colorDEDEDE,
                        textStyleColor: AppColors.black,
                        controller: emailController,
                        onChanged: (value) {
                          Get.find<InfoBloc>().add(OnEmailChange(value));
                        },
                        errors: [state.validEmail],
                      ),
                      67.height,
                      Row(children: [
                        AppButton(
                          onTap: () {
                            Get.find<InfoBloc>().add(const OnSubmitEmail(false));
                          },
                          width: (Get.width - 50) / 2,
                          height: 55,
                          title: '登録する',
                        ),
                        const Spacer(),
                        AppButton(
                          onTap: () => Navigator.of(context).pop(),
                          backgroundColor: AppColors.color9B9B9B,
                          width: (Get.width - 50) / 2,
                          height: 55,
                          title: 'キャンセル',
                        )
                      ])
                    ],
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
