import 'model/notification.dart';

class NotificationListData {
  late final List<Notification> notifications;
  int? totalItems;
  int? totalPages;
  int? currentPage;

  NotificationListData({
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.notifications,
  });

  NotificationListData.fromJson(Map<String, dynamic> json) {
    try {
      totalItems = json['total_items'];
      totalPages = json['total_pages'];
      currentPage = json['current_page'];
      notifications = List.from(json['data']).map((e) => Notification.fromJson(e)).toList();
    } catch (e) {
      totalItems = 0;
      totalPages = 0;
      currentPage = 0;
      notifications = [];
    }
  }
}
