class NotificationUnread {
  late final bool isNotifyUnread;

  NotificationUnread({
    required this.isNotifyUnread,
  });

  NotificationUnread.fromJson(Map<String, dynamic> json) {
    try {
      isNotifyUnread = json['has_a_unread_notifi'];
    } catch (e) {
      isNotifyUnread = false;
    }
  }
}
