import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../../../core/model/response/model/user.dart';
import '../../../locale/locale_key.dart';
import '../../../utils/app_appbar.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_dimensions.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/app_utils.dart';
import '../../base/base_page.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_single_scrollview.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/base/app_body.dart';
import 'interactor/personal_info_edit_bloc.dart';

class PersonalInfoEditPage extends StatefulWidget {
  const PersonalInfoEditPage({super.key});
  @override
  PersonalInfoEditPageState createState() {
   return PersonalInfoEditPageState();
  }
}

class PersonalInfoEditPageState extends State<PersonalInfoEditPage> {

  TextEditingController? fullNameController;
  TextEditingController? kataNameController;
  TextEditingController? birthDateController;
  TextEditingController? phoneNumberController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    kataNameController = TextEditingController();
    birthDateController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  void _fillData(User? user) {
    fullNameController?.text = user?.name ?? '';
    kataNameController ?.text = user?.nameKata ?? '';
    birthDateController?.text =  user?.birthdate != null ? user!.birthdate! : '';
    phoneNumberController?.text = user?.tel ?? '';
  }

  @override
  void dispose() {
    fullNameController?.dispose();
    kataNameController?.dispose();
    birthDateController?.dispose();
    phoneNumberController?.dispose();
    Get.delete<PersonalInfoEditBloc>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<PersonalInfoEditBloc>()..add(Init(onInitSuccess: (user) {
        _fillData(user);
      })),
      child: BlocConsumer<PersonalInfoEditBloc, PersonalInfoEditState>(
        listener: (BuildContext context, PersonalInfoEditState state) {
          birthDateController?.text = state.birthDate != null ? AppUtils.formatDate(state.birthDate!, format: AppUtils.yyyyMMdd) : '';
        },
        builder: (BuildContext context, PersonalInfoEditState state) {
          return AppBody(
            pageState: state.status,
            success: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: CustomAppBar(
                  title: LocaleKey.personalInfo.tr, iconLeading: AppAssets.ic_back_2_svg),
              body: BasePage(
                unFocusWhenTouchOutsideInput: true,
                child: Padding(
                  padding: AppDimensions.paddingTop,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: 40.borderRadiusTop,
                    ),
                    padding: AppDimensions.allMargins,
                    child: AppSingleScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.height,
                          Text(
                            LocaleKey.fullName.tr,
                            style: AppStyles.fontSize14(
                              fontWeight: FontWeight.w600,
                              height: 21 / 14,
                              color: AppColors.black,
                            ),
                          ),
                          12.height,
                          AppTextField(
                            hintText: LocaleKey.hintFullName.tr,
                            borderColor: AppColors.colorDEDEDE,
                            textStyleColor: AppColors.black,
                            controller: fullNameController,
                            onChanged: (value) {
                              context.read<PersonalInfoEditBloc>().add(OnChangeFullName(value));
                            },
                            errors: [state.validFullName],
                          ),
                          15.height,
                          Text(
                            LocaleKey.katakana.tr,
                            style: AppStyles.fontSize14(
                              fontWeight: FontWeight.w600,
                              height: 21 / 14,
                              color: AppColors.black,
                            ),
                          ),
                          12.height,
                          AppTextField(
                            controller: kataNameController,
                            hintText: LocaleKey.hintKatakana.tr,
                            borderColor: AppColors.colorDEDEDE,
                            textStyleColor: AppColors.black,
                            onChanged: (value) {
                              context.read<PersonalInfoEditBloc>().add(OnChangeKataName(value));
                            },
                            errors: [state.validKataName],
                          ),
                          15.height,
                          Text(
                            LocaleKey.dateOfBirth.tr,
                            style: AppStyles.fontSize14(
                              fontWeight: FontWeight.w600,
                              height: 21 / 14,
                              color: AppColors.black,
                            ),
                          ),
                          12.height,
                          Stack(
                            children: [
                              AppTextField(
                                controller: birthDateController,
                                hintText: LocaleKey.hintDateOfBirth.tr,
                                borderColor: AppColors.colorDEDEDE,
                                textStyleColor: AppColors.black,
                                errors: [state.validBirthDate],
                              ),
                              Positioned(
                                top: 23,
                                right: 24,
                                child: SvgPicture.asset(
                                    width: 16,
                                    height: 16,
                                    AppAssets.ic_calendar_svg,
                                    colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
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
                                            context.read<PersonalInfoEditBloc>().add(OnChangeBirthDate(selectedDate));
                                          }
                                        }
                                      },
                                      child: Container(
                                        color: Colors.transparent,
                                      )))
                            ],
                          ),
                          15.height,
                          Text(
                            LocaleKey.telephoneNumber.tr,
                            style: AppStyles.fontSize14(
                              fontWeight: FontWeight.w600,
                              height: 21 / 14,
                              color: AppColors.black,
                            ),
                          ),
                          12.height,
                          AppTextField(
                            controller: phoneNumberController,
                            hintText: LocaleKey.hintPhone.tr,
                            borderColor: AppColors.colorDEDEDE,
                            textStyleColor: AppColors.black,
                            onChanged: (value) {
                              context.read<PersonalInfoEditBloc>().add(OnChangePhoneNumber(phoneNumberController?.text ?? ''));
                            },
                            errors: [state.validPhoneNumber],
                          ),
                          32.height,
                          Row(children: [
                            AppButton(
                              onTap: () {
                                onUpdatePersonalInfoSuccess () {
                                  Navigator.of(context).pop();
                                }
                                context.read<PersonalInfoEditBloc>()
                                    .add(OnSubmitPersonalInfo(onUpdatePersonalInfoSuccess: onUpdatePersonalInfoSuccess));
                              },
                              width: (Get.width - 50) / 2,
                              height: 55,
                              title: LocaleKey.save.tr,
                            ),
                            const Spacer(),
                            AppButton(
                              onTap: () => Navigator.of(context).pop(),
                              backgroundColor: AppColors.color9B9B9B,
                              width: (Get.width - 50) / 2,
                              height: 55,
                              title: LocaleKey.cancel.tr,
                            )
                          ])
                        ],
                      ),
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
