import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/app_styles.dart';

class ImageResourceDialog extends StatefulWidget {

  final void Function(ImageSource imageSrouce)? onConfirmPressed;

  const ImageResourceDialog({super.key, this.onConfirmPressed});

  @override
  ImageResourceDialogState createState() {
    return ImageResourceDialogState();
  }

}

class ImageResourceDialogState extends State<ImageResourceDialog> {

  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: AppDimensions.allMargins,
      backgroundColor: AppColors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 10),
        child: Text(
          'オプション',
          style: AppStyles.fontSize16(
            fontFamily: AppStyles.fontHiraginoKakuProW6,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(title: const Text('カメラ',), onTap: () {
            Navigator.of(context).pop();
            widget.onConfirmPressed?.call(ImageSource.camera);
          },),
          ListTile(title: const Text('ギャラリー',), onTap: () {
            Navigator.of(context).pop();
            widget.onConfirmPressed?.call(ImageSource.gallery);
          },)
        ],
      ),
    );
  }
}
