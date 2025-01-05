import 'package:flutter/material.dart';
import 'package:callmobile/utils/app_constants.dart';

// Validate input
class Validation {
  static String validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return '電話番号は必須です';
    } else if(value.length > 11 || value.length < 10) {
      return '電話番号が無効です';
    }
    return '';
  }

  static String validateName({required String fieldName, required String? value}) {
    if (value?.isEmpty ?? true) {
      return '$fieldNameは必須です';
    } else {
      return '';
    }
  }

  static String validateEmail(String value) {
    final regex = RegExp(AppConstants.patternEmail);
    if (value.isEmpty) {
      return 'メールアドレスは必須です';
    } else if (!regex.hasMatch(value)) {
      return '無効なメールアドレス';
    } else {
      return '';
    }
  }

  // Validate password
  static String validatePassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return 'パスワードが必要です';
    } else if (length < 8) {
      return 'パスワードは8文字以上でなければなりません';
    } else {
      return '';
    }
  }

  // Validate update password
  static String validateUpdatePassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return '新規のパスワードが必要です';
    } else if (length < 8) {
      return '新規のパスワードは8文字以上でなければなりません';
    } else {
      return '';
    }
  }

  // Validate update confirm password
  static String validateUpdateConfirmPassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return '新規のパスワード(確認用) が必要です';
    } else if (length < 8) {
      return '新規のパスワード(確認用) は8文字以上でなければなりません';
    } else {
      return '';
    }
  }

  // Validate Confirm password
  static String validateConfirmPassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return 'パスワード（確認用）が必要です';
    } else if (length < 8) {
      return 'パスワードは8文字以上でなければなりません';
    } else {
      return '';
    }
  }

  static String validateMatchConfirmPassword({required String confirmPassword, required String password, bool isUpdate = false}) {
    if(password.isEmpty) {
      return isUpdate ? validateUpdateConfirmPassword(confirmPassword) : validateConfirmPassword(confirmPassword);
    } else {
      if(confirmPassword != password) {
        return 'パスワードの確認が一致しません';
      }
      return '';
    }
  }

  // Validate username
  static String? Function(String?) validateUsername(BuildContext context) {
    return (value) {
      var pattern = r'^[a-zA-Z0-9-_]+$';
      var pattern_2 = r'^(?![_-])[a-zA-Z0-9-_]+$';
      final regExp = RegExp(pattern);
      final regExp_2 = RegExp(pattern_2);
      final length = value?.trim().length ?? 0;
      if (length == 0) {
        return '';
      } else if (length > 15) {
        return '';
      } else if (!regExp.hasMatch(value ?? "")) {
        return '';
      } else if (!regExp_2.hasMatch(value ?? "")) {
        return '';
      }
      return null;
    };
  }
}
