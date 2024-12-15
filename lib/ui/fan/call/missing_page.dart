import 'dart:async';

import 'package:callmobile/extensions/int_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../locale/locale_key.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_styles.dart';
import '../../base/base_page.dart';

enum MissingType {
  missing,
  connect,
}

class MissingPage extends StatefulWidget {
  final MissingType type;
  const MissingPage({
    super.key,
    required this.type,
  });

  @override
  State<MissingPage> createState() => _MissingPageState();
}

class _MissingPageState extends State<MissingPage> {
  int _start = 3;
  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        _start--;
      } else {
        _timer?.cancel();
        Navigator.pop(context);
      }
    });
  }

  @override
  void initState() {
    _start = 3;
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BasePage(
        isBackground: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.type == MissingType.missing) ...[
                Image.asset(
                  AppAssets.ic_sad_png,
                  width: 70,
                  height: 70,
                ),
                30.height,
                Text(
                  LocaleKey.createNotReceiveCall.tr,
                  style: AppStyles.fontSize14(fontWeight: FontWeight.w600),
                )
              ],
              if (widget.type == MissingType.connect) ...[
                Image.asset(
                  AppAssets.ic_cry_png,
                  width: 92,
                  height: 70,
                ),
                30.height,
                Text(
                  LocaleKey.retryCall.tr,
                  style: AppStyles.fontSize14(fontWeight: FontWeight.w600, height: 21 / 14),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
