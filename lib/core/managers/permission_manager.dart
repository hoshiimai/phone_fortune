import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../locale/locale_key.dart';
import '../../ui/widgets/base/app_dialog.dart';

enum PermissionType { contact, camera, photos }

class PermissionManager {
  Future<bool> checkPermission(Permission permission, PermissionType type,
      {bool showDialog = true}) async {
    bool isPermission = true;
    var status = await permission.status;
    if (status.isDenied) {
      status = await permission.request();
    } else if (status.isPermanentlyDenied) {
      isPermission = false;
      if (showDialog) {
        await showConfirmDialog(
            message: LocaleKey.settingContent.trParams({'name': type.name}),
            textConfirm: LocaleKey.goToSettings.tr,
            onClickConfirm: () async {
              Get.back();
              await openAppSettings();
            },
            onClickCancel: () {
              Get.back();
            });
      }
    }

    if (status.isDenied) isPermission = false;

    return isPermission;
  }
}
