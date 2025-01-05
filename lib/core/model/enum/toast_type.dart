import 'package:flutter/material.dart';
import 'package:get/get.dart';


enum ToastType {
  success(Colors.green),
  error(Colors.red);

  final Color color;

  const ToastType(this.color);

  Widget get icon {
    IconData icon;
    switch (this) {
      case ToastType.success:
        icon = Icons.check_circle_rounded;
        break;
      case ToastType.error:
        icon = Icons.error_rounded;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Icon(icon, size: 40, color: color),
    );
  }

  Widget get title {
    switch (this) {
      case ToastType.success:
        return Text('成功', style: TextStyle(color: color));
      case ToastType.error:
        return Text('エラー', style: TextStyle(color: color));
    }
  }
}
