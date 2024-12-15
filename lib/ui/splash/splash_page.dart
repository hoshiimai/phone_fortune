import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:callmobile/utils/app_assets.dart';

import 'interactor/splash_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Get.find<SplashBloc>()..add(const Init()),
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          Get.find<SplashBloc>().add(const OnClearPageCommand());
        },
        builder: (context, state) {
          return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.bg_png),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Image.asset(
                  AppAssets.logo_png,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
              );
        },
      ),
    );
  }
}
