import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/utils/app_constants.dart';

import '../locale/locale_key.dart';

// Validate input
class Validation {
  static String validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return LocaleKey.phoneNumberIsRequired.tr;
    } else if(value.length > 11 || value.length < 10) {
      return LocaleKey.phoneNumberNotValid.tr;
    }
    return '';
  }

  static String validateCallFee(String? value) {
    if ((value?.isEmpty ?? true) || value?.trim() == '0') {
      return LocaleKey.required.tr;
    } else {
      return '';
    }
  }

  static String validateName({required String fieldName, required String? value}) {
    if (value?.isEmpty ?? true) {
      return LocaleKey.nameIsRequired.trParams({"fieldName": fieldName});
    } else {
      return '';
    }
  }

  static String validateEmail(String value) {
    final regex = RegExp(AppConstants.patternEmail);
    if (value.isEmpty) {
      return LocaleKey.emailIsRequired.tr;
    } else if (!regex.hasMatch(value)) {
      return LocaleKey.emailIsInvalid.tr;
    } else {
      return '';
    }
  }

  // Validate password
  static String validatePassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return LocaleKey.passwordIsRequired.tr;
    } else if (length < 8) {
      return LocaleKey.passwordIsInvalid.tr;
    } else {
      return '';
    }
  }

  // Validate update password
  static String validateUpdatePassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return LocaleKey.newPasswordIsRequired.tr;
    } else if (length < 8) {
      return LocaleKey.newPasswordIsInvalid.tr;
    } else {
      return '';
    }
  }

  // Validate update confirm password
  static String validateUpdateConfirmPassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return LocaleKey.newConfirmPasswordIsRequired.tr;
    } else if (length < 8) {
      return LocaleKey.newConfirmPasswordIsInvalid.tr;
    } else {
      return '';
    }
  }

  // Validate Confirm password
  static String validateConfirmPassword(String value) {
    final length = value.trim().length;
    if (length == 0) {
      return LocaleKey.confirmPasswordIsRequired.tr;
    } else if (length < 8) {
      return LocaleKey.passwordIsInvalid.tr;
    } else {
      return '';
    }
  }

  static String validateMatchConfirmPassword({required String confirmPassword, required String password, bool isUpdate = false}) {
    if(password.isEmpty) {
      return isUpdate ? validateUpdateConfirmPassword(confirmPassword) : validateConfirmPassword(confirmPassword);
    } else {
      if(confirmPassword != password) {
        return LocaleKey.passwordConfirmNotMatched.tr;
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

  // Validate amount
  static String validAmount(int amount) {
    if (amount == 0) {
      return LocaleKey.amountGreaterThanZero.tr;
    } else {
      return '';
    }
  }
}
