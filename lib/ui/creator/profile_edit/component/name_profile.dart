import 'package:callmobile/utils/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';
import '../../../widgets/app_text_field.dart';
import '../interactor/creator_profile_edit_bloc.dart';

class NameProfile extends StatefulWidget {

  final String? name;

  const NameProfile({super.key, required this.name});

  @override
  NameProfileState createState() {
    return NameProfileState();
  }
}

class NameProfileState extends State<NameProfile> {

  TextEditingController? nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController()..text = widget.name ?? '';
  }

  @override
  void dispose() {
    nameController?.dispose();
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
              '名前',
              style: AppStyles.fontSize14(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            20.height,
            AppTextField(
              controller: nameController,
              hintText: '名前',
              borderColor: AppColors.colorDEDEDE,
              textStyleColor: AppColors.black,
              onChanged: (value) {
                context.read<CreatorProfileEditBloc>().add(OnNameChanged(nameController?.text ?? ''));
              },
              errors: [state.validName],
            ),
          ],
        );
      },
    );
  }
}
