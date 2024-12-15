import 'package:flutter/material.dart';
import 'package:callmobile/utils/app_color_schemes.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_dimensions.dart';

class AppThemes {
  // static ThemeData get darkTheme {
  //   return ThemeData(
  //     brightness: Brightness.dark,
  //     useMaterial3: false,
  //     appBarTheme: appBarThemeData(),
  //     inputDecorationTheme: inputDecorationThemeData,
  //     elevatedButtonTheme: elevatedButtonThemeData,
  //     outlinedButtonTheme: outlinedButtonThemeData,
  //     buttonTheme: buttonThemeData,
  //     bottomSheetTheme: bottomSheetThemeData,
  //     bottomNavigationBarTheme: bottomNavigationThemeData(AppColorSchemes.darkColorScheme),
  //     colorScheme: AppColorSchemes.darkColorScheme,
  //     snackBarTheme: snackBarThemeData,
  //     scaffoldBackgroundColor: AppColorSchemes.darkColorScheme.onPrimary,
  //     extensions: const <ThemeExtension<dynamic>>[AppColorTheme.dark],
  //     fontFamily: AppStyles.fontFamily,
  //     dialogTheme: dialogThemeData,
  //     splashColor: AppColors.transparent,
  //     highlightColor: AppColors.transparent,
  //     pageTransitionsTheme: pageTransitionsTheme,
  //     radioTheme: RadioThemeData(
  //       fillColor: MaterialStateProperty.all<Color>(AppColorSchemes.darkColorScheme.primary),
  //       overlayColor: MaterialStateProperty.all<Color>(AppColorSchemes.darkColorScheme.onPrimary),
  //     ),
  //   );
  // }
  //
  // static ThemeData get lightTheme {
  //   return ThemeData(
  //     brightness: Brightness.light,
  //     useMaterial3: true,
  //     appBarTheme: appBarThemeData(),
  //     inputDecorationTheme: inputDecorationThemeData,
  //     elevatedButtonTheme: elevatedButtonThemeData,
  //     outlinedButtonTheme: outlinedButtonThemeData,
  //     buttonTheme: buttonThemeData,
  //     bottomSheetTheme: bottomSheetThemeData,
  //     bottomNavigationBarTheme: bottomNavigationThemeData(AppColorSchemes.lightColorScheme),
  //     colorScheme: AppColorSchemes.lightColorScheme,
  //     snackBarTheme: snackBarThemeData,
  //     scaffoldBackgroundColor: AppColorSchemes.lightColorScheme.onPrimary,
  //     extensions: const <ThemeExtension<dynamic>>[AppColorTheme.dark],
  //     fontFamily: AppStyles.fontFamily,
  //     dialogTheme: dialogThemeData,
  //     splashColor: AppColors.transparent,
  //     highlightColor: AppColors.transparent,
  //     pageTransitionsTheme: pageTransitionsTheme,
  //   );
  // }

  static final ThemeData lightTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColors.primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // fontFamily: AppFonts.fontMontserrat,
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
  );
}

Size get _minimumSize => const Size(46, 46);

RoundedRectangleBorder get _shape => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    );

EdgeInsetsGeometry get _padding => AppDimensions.allMargins;

// AppBarTheme appBarThemeData() => AppBarTheme(
//       titleTextStyle: AppStyles.fontSize20(),
//       centerTitle: false,
//       elevation: 0.0,
//       backgroundColor: AppColorSchemes.lightColorScheme.surfaceVariant,
//       surfaceTintColor: AppColorSchemes.lightColorScheme.surfaceVariant,
//     );

InputDecorationTheme get inputDecorationThemeData => const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(width: 0),
      ),
    );

ElevatedButtonThemeData get elevatedButtonThemeData => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: _minimumSize,
        shape: _shape,
        padding: _padding,
      ),
    );

OutlinedButtonThemeData get outlinedButtonThemeData => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: _minimumSize,
        shape: _shape,
        padding: _padding,
      ),
    );

ButtonThemeData get buttonThemeData => ButtonThemeData(
      shape: _shape,
      minWidth: double.maxFinite,
      padding: _padding,
    );

BottomSheetThemeData get bottomSheetThemeData => BottomSheetThemeData(
      backgroundColor: AppColorSchemes.lightColorScheme.surface,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
    );

PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme(builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    });

BottomNavigationBarThemeData bottomNavigationThemeData(ColorScheme colorSchemes) {
  return BottomNavigationBarThemeData(
    backgroundColor: colorSchemes.onPrimary,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: colorSchemes.primary,
    unselectedItemColor: AppColors.primary,
    landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    type: BottomNavigationBarType.fixed,
  );
}

SnackBarThemeData get snackBarThemeData {
  return SnackBarThemeData(
    backgroundColor: AppColorSchemes.darkColorScheme.tertiary,
    actionTextColor: AppColorSchemes.darkColorScheme.primary,
    contentTextStyle: const TextStyle(color: AppColors.black),
  );
}

DialogTheme get dialogThemeData {
  return DialogTheme(
    backgroundColor: AppColorSchemes.darkColorScheme.tertiary,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28.0))),
  );
}
