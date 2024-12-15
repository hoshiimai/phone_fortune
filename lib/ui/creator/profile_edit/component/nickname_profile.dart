import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../locale/locale_key.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../widgets/app_text_field.dart';
import '../interactor/creator_profile_edit_bloc.dart';

class NickNameProfile extends StatefulWidget {

  final String? nickName;

  const NickNameProfile({super.key, required this.nickName});

  @override
  NickNameProfileState createState() {
    return NickNameProfileState();
  }
}

class NickNameProfileState extends State<NickNameProfile> {

  TextEditingController? nickNameController;

  @override
  void initState() {
    super.initState();
    nickNameController = TextEditingController()..text = widget.nickName ?? '';
  }

  @override
  void dispose() {
    nickNameController?.dispose();
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
              LocaleKey.name.tr,
              style: AppStyles.fontSize14(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            20.height,
            AppTextField(
              controller: nickNameController,
              hintText: LocaleKey.name.tr,
              borderColor: AppColors.colorDEDEDE,
              textStyleColor: AppColors.black,
              onChanged: (value) {
                context.read<CreatorProfileEditBloc>().add(OnNickNameChanged(nickNameController?.text ?? ''));
              },
              errors: const [],
            ),
          ],
        );
      },
    );
  }
}
