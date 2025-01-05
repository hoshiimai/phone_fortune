import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static const yyyyMMdd = 'yyyy/MM/dd';
  static const yyyyMMddHHmm_24 = 'yyyy/MM/dd HH:mm';
  static const yyyyMM = 'yyyy-MM';
  static const yyyyMMHHmm = 'MM/dd HH:mm';
  static const yyyyMMddHor = 'yyyy-MM-dd';

  /// Check is debug mode
  static bool isDebugMode() {
    if (kReleaseMode) {
      return false;
    } else {
      return true;
    }
  }

  static String formatUtcTime(
      {required String? dateUtc,
      String? format = 'dd/MM/yyyy HH:mm:ss',
      String languageCode = 'en'}) {
    try {
      if (dateUtc == null) return "";

      String date = dateUtc;
      if (!date.contains("Z")) {
        date = "${date}Z";
      }
      var dateLocal = DateTime.parse(date).toLocal();
      return DateFormat(format).format(dateLocal);
    } catch (e) {
      return '-:--';
    }
  }

  static String formatNumber(int number) {
    if (number < 1000) {
      return number.toString();
    } else if (number < 10000) {
      return '${(number / 1000).toStringAsFixed(1)}k';
    } else {
      return '${(number / 1000).round()}k';
    }
  }

  static String formatThousand(double price) {
    String formattedAmount = NumberFormat('#,##0').format(price);

    return formattedAmount;
  }

  static String formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(hours);
    String twoDigitMinutes = twoDigits(minutes);
    String twoDigitSeconds = twoDigits(remainingSeconds);

    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String formatTimeToShort(DateTime time) {
    return DateFormat('HH:mm').format(time);
  }

  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format, 'ja').format(date);
  }

  static String sum(double pointCall, int pointTip) {
    return formatThousand(pointCall + pointTip);
  }

  static String getDayOfWeek(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return '月'; // Monday
      case 2:
        return '火';
      case 3:
        return '水'; //Wednesday
      case 4:
        return '木'; //Thursday
      case 5:
        return '金'; //Friday
      case 6:
        return '土'; //Saturday
      case 7:
        return '日'; //Sunday
      default:
        return ""; //Nothing
    }
  }

  static String monthNumberToString(int? month) {
    // List of month names, indexed from 1 (January) to 12 (December)
    const List<String> months = [
      '', // index 0 is unused
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    // Return the month name if the month is valid (1-12)
    if (month != null && month >= 1 && month <= 12) {
      return months[month];
    } else {
      return ''; // Handle invalid month numbers
    }
  }

  static String monthNumberToShortString(int? month) {
    // List of month names, indexed from 1 (January) to 12 (December)
    const List<String> months = [
      '', // index 0 is unused
      'Jan.',
      'Feb.',
      'Mar.',
      'Apr.',
      'May',
      'Jun.',
      'Jul.',
      'Aug.',
      'Sep.',
      'Oct.',
      'Nov.',
      'Dec.',
    ];

    // Return the month name if the month is valid (1-12)
    if (month != null && month >= 1 && month <= 12) {
      return months[month];
    } else {
      return ''; // Handle invalid month numbers
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  static String generateNonce([int length = 32]) {
    const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  static String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  static String convertSecondToTime(int timeCall) {
    int minutes = timeCall ~/ 60;
    int seconds = timeCall % 60;

    String formattedTime =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  static int convertTimeToSecond(DateTime liveAt) {
    DateTime now = DateTime.now();

    Duration difference = now.difference(liveAt);

    int secondsDifference = difference.inSeconds;

    return secondsDifference;
  }

  static String convertDateByString(String dateString) {
    int year = int.parse(dateString.substring(0, 4));
    int month = int.parse(dateString.substring(4, 6));
    int day = int.parse(dateString.substring(6, 8));

    // Create a DateTime object
    DateTime parsedDate = DateTime(year, month, day, 24, 00);

    return DateFormat(yyyyMMddHHmm_24).format(parsedDate);
  }

  static DateTime convertStringToDate(String dateString) {
    try {
      dateString = "$dateString-01";

      DateTime dateTime = DateTime.parse(dateString);

      return dateTime;
    } catch (ex) {
      return DateTime.now();
    }
  }

  static DateTime convertToDate(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString);

      return dateTime;
    } catch (ex) {
      return DateTime.now();
    }
  }

  static DateTime adjustMonth(DateTime date, int months) {
    int newYear = date.year + ((date.month + months - 1) ~/ 12);
    int newMonth = (date.month + months) % 12;

    if (newMonth <= 0) {
      newMonth += 12;
      newYear -= 1;
    }

    int newDay = date.day;
    int lastDayOfMonth = DateTime(newYear, newMonth + 1, 0).day;
    if (newDay > lastDayOfMonth) {
      newDay = lastDayOfMonth;
    }

    return DateTime(newYear, newMonth, newDay, date.hour, date.minute, date.second);
  }

  static String updateMonth(String date, int month) {
    DateTime time = convertStringToDate(date);

    DateTime newDate = adjustMonth(time, month);

    String dateConvert = AppUtils.formatDate(newDate, format: AppUtils.yyyyMM);

    return dateConvert;
  }

  static formatRating(double rate) {
    if (rate == rate.toInt()) {
      return rate.toInt().toString();
    } else {
      final formatter = NumberFormat('0.0');
      return formatter.format(rate);
    }
  }

  static String formatDurationInJapanese(int seconds) {
    int minutes = seconds ~/ 60;  // Integer division to get minutes
    int remainingSeconds = seconds % 60;  // Get the remaining seconds after minutes

    return "$minutes分$remainingSeconds秒";
  }

  static String formatDurationMinToHourJapanese(int minutes) {
    int hours = minutes ~/ 60;  // Integer division to get hours
    int remainingMin = minutes % 60;  // Get the remaining minutes after hours
    if(hours > 0) {
      return "$hours時間$remainingMin分待ち";
    } else {
      return "$remainingMin分待ち";
    }
  }
}
