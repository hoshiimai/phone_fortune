import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../widgets/app_text_field.dart';
import '../interactor/creator_profile_edit_bloc.dart';

class BioProfile extends StatefulWidget {
  final String? welcomeMessages;

  const BioProfile({super.key, required this.welcomeMessages});

  @override
  BioProfileState createState() {
    return BioProfileState();
  }

}

class BioProfileState extends State<BioProfile> {

  TextEditingController? bioController;

  @override
  void initState() {
    super.initState();
    bioController = TextEditingController()..text = widget.welcomeMessages ?? '';
  }

  @override
  void dispose() {
    bioController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatorProfileEditBloc, CreatorProfileEditState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '紹介',
              style: AppStyles.fontSize14(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            20.height,
            AppTextField(
              controller: bioController,
              hintText: '紹介',
              borderColor: AppColors.colorDEDEDE,
              textStyleColor: AppColors.black,
              textStyle: AppStyles.fontSize12(height: 20 / 12, color: AppColors.black),
              keyboardType: TextInputType.multiline,
              height: 132,
              onChanged: (value) {
                context.read<CreatorProfileEditBloc>().add(OnWelcomeMessageChanged(bioController?.text ?? ''));
              },
              errors: const [],
            ),
          ],
        );
      },
    );
  }
}
