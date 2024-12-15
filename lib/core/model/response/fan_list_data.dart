import 'model/user.dart';

class FanListData {
  late final List<User> fans;
  late final int totalItems;
  late final int totalPages;
  late final int currentPage;

  FanListData({
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.fans,
  });

  FanListData.fromJson(Map<String, dynamic> json) {
    try {
      totalItems = json['total_items'];
      totalPages = json['total_pages'];
      currentPage = json['current_page'];
      fans = List.from(json['data']).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      totalItems = 0;
      totalPages = 0;
      currentPage = 0;
      fans = [];
    }
  }
}
