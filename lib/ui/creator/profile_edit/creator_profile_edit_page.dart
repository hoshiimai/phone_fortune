import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../core/model/enum/enum_role.dart';
import '../../../locale/locale_key.dart';
import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../base/base_page.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_single_scrollview.dart';
import '../../widgets/base/app_body.dart';
import 'component/avatar_profile.dart';
import 'component/banner_profile.dart';
import 'component/bio_profile.dart';
import 'component/nickname_profile.dart';
import 'interactor/creator_profile_edit_bloc.dart';

class CreatorProfileEditPage extends StatefulWidget {
  const CreatorProfileEditPage({super.key});
  @override
  CreatorProfileEditPageState createState() {
    return CreatorProfileEditPageState();
  }

}

class CreatorProfileEditPageState extends State<CreatorProfileEditPage> {

  @override
  void dispose() {
    Get.delete<CreatorProfileEditBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatorProfileEditBloc>(
      create: (context) => Get.find<CreatorProfileEditBloc>()..add(const Init()),
      child: BlocConsumer<CreatorProfileEditBloc, CreatorProfileEditState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (BuildContext context, CreatorProfileEditState state) {},
        builder: (BuildContext context, CreatorProfileEditState state) {
          if (state.user == null) {
            return const SizedBox.shrink();
          }
          return AppBody(
            pageState: state.status,
            success: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: CustomAppBar(
                implyLeading: true,
                iconLeading: AppAssets.ic_back_2_svg,
                title: LocaleKey.titleEditProfile.tr,
              ),
              floatingActionButton: Padding(
                padding: 32.paddingBottom.copyWith(left: 20, right: 20),
                child: Row(
                  children: [
                    AppButton(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        onUpdateProfileSuccess() {
                          Navigator.of(context).pop();
                        }
                        context
                            .read<CreatorProfileEditBloc>()
                            .add(OnUpdateProfile(onUpdateProfileSuccess: onUpdateProfileSuccess));
                      },
                      width: (Get.width - 50) / 2,
                      height: 55,
                      title: LocaleKey.register.tr,
                    ),
                    const Spacer(),
                    AppButton(
                      onTap: () => Navigator.of(context).pop(),
                      backgroundColor: AppColors.color9B9B9B,
                      width: (Get.width - 50) / 2,
                      height: 55,
                      title: LocaleKey.cancel.tr,
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              body: BasePage(
                unFocusWhenTouchOutsideInput: true,
                child: Stack(
                  children: [
                    Padding(
                      padding: AppDimensions.paddingTop,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: 40.borderRadiusTop,
                        ),
                        padding: AppDimensions.sideMargins.copyWith(top: 20, bottom: 80),
                        child: AppSingleScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              8.height,
                              BannerProfile(),
                              45.height,
                              AvatarProfile(),
                              45.height,
                              NickNameProfile(nickName: state.nickName),
                              27.height,
                              BioProfile(welcomeMessages: state.welcomeMessages),
                            ],
                          ),
                        ),
                      ),
                    ),
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