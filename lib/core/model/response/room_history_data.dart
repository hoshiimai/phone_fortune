import 'package:flutter/material.dart';
import 'package:callmobile/core/model/response/model/room.dart';

class RoomHistoryData {
  late final List<Room> rooms;
  late final int totalItems;
  late final int totalPages;
  late final int currentPage;

  RoomHistoryData({
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.rooms,
  });

  RoomHistoryData.fromJson(Map<String, dynamic> json) {
    try {
      totalItems = json['total_items'];
      totalPages = json['total_pages'];
      currentPage = json['current_page'];
      rooms = List.from(json['data']).map((e) => Room.fromJson(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      totalItems = 0;
      totalPages = 0;
      currentPage = 0;
      rooms = [];
    }
  }
}
