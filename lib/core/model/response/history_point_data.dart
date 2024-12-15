import 'package:flutter/material.dart';
import 'package:callmobile/core/model/response/model/point_transaction.dart';

class HistoryPointData {
  late final List<PointTransaction> pointTransactions;
  late final int totalItems;
  late final int totalPages;
  late final int currentPage;
  late final int withdrawPending;

  HistoryPointData({
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.pointTransactions,
    required this.withdrawPending,
  });

  HistoryPointData.fromJson(Map<String, dynamic> json) {
    try {
      totalItems = json['total_items'];
      totalPages = json['total_pages'];
      currentPage = json['current_page'];
      withdrawPending = json['withdraw_pending'];
      pointTransactions = List.from(json['data']).map((e) => PointTransaction.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      totalItems = 0;
      totalPages = 0;
      currentPage = 0;
      withdrawPending = 0;
      pointTransactions = [];
    }
  }
}
