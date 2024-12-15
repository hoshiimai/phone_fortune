import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:callmobile/locale/locale_key.dart';
import 'package:callmobile/utils/app_colors.dart';
import 'package:callmobile/utils/app_utils.dart';

enum TypePoint {
  buy,
  use,
  received,
  withdrawed;

  Color get color {
    switch (this) {
      case TypePoint.buy:
      case TypePoint.received:
        return AppColors.color6ABDDB;
      case TypePoint.use:
      case TypePoint.withdrawed:
        return AppColors.colorFF003B;
    }
  }

  String get description {
    switch (this) {
      case TypePoint.buy:
        return LocaleKey.purchasedDescription.tr;
      case TypePoint.received:
        return LocaleKey.receivedDescription.tr;
      case TypePoint.use:
        return LocaleKey.usedDescription.tr;
      case TypePoint.withdrawed:
        return LocaleKey.withdrawedDescription.tr;
    }
  }

  static TypePoint fromInt(int type) {
    switch (type) {
      case 0:
        return TypePoint.buy;
      case 1:
        return TypePoint.use;
      case 2:
        return TypePoint.received;
      case 3:
        return TypePoint.withdrawed;
      default:
        return TypePoint.buy;
    }
  }
}

class PointTransaction {
  final int id;
  final int userId;
  final int amount;
  final TypePoint type;
  final String? createdDate;

  PointTransaction({
    required this.id,
    required this.userId,
    required this.amount,
    required this.type,
    required this.createdDate,
  });

  factory PointTransaction.fromJson(Map<String, dynamic> json) {
    return PointTransaction(
      id: json['id'],
      userId: json['user_id'],
      amount: json['amount'],
      type: TypePoint.fromInt(json['type']),
      createdDate: AppUtils.formatDate(DateTime.parse(json['created_at']).toLocal(),
          format: 'yyyy/MM/dd HH:mm'),
    );
  }
}
