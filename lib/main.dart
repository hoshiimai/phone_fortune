import 'package:callmobile/utils/app_constants.dart';
import 'package:callmobile/utils/app_pages.dart';
import 'package:callmobile/utils/app_themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'di/di_graph_setup.dart';
import 'locale/translation_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Setup Dependencies Graph
  await setupDependenciesGraph();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: GetMaterialApp(
        // navigatorKey: Get.find<Alice>().getNavigatorKey(),
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child!,
          );
        },
        key: const Key('main'),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppPages.splash,
        getPages: AppPages.pages,
        locale: Get.find<TranslationManager>().locale,
        fallbackLocale: TranslationManager.fallbackLocaleUS,
        translations: Get.find<TranslationManager>(),
        title: AppConstants.appName,
        theme: AppThemes.lightTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          TranslationManager.fallbackLocaleUS,
          TranslationManager.fallbackLocaleJP
        ],
      ),
    );
  }
}
