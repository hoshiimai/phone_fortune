import 'model/user.dart';

class CreatorListData {
  late final List<User> creators;
  late final int totalItems;
  late final int totalPages;
  late final int currentPage;

  CreatorListData({
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.creators,
  });

  CreatorListData.fromJson(Map<String, dynamic> json) {
    try {
      totalItems = json['total_items'];
      totalPages = json['total_pages'];
      currentPage = json['current_page'];
      creators = List.from(json['data']).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      totalItems = 0;
      totalPages = 0;
      currentPage = 0;
      creators = [];
    }
  }
}
