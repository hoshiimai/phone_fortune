import 'model/user.dart';

class ListCreatorResponse {
  late final List<User> user;
  late final int totalItems;
  late final int totalPages;
  late final int currentPage;
  late final int totalPoint;

  ListCreatorResponse({
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.user,
    required this.totalPoint,
  });

  ListCreatorResponse.fromJson(Map<String, dynamic> json) {
    try {
      totalItems = json['total_items'];
      totalPages = json['total_pages'];
      currentPage = json['current_page'];
      totalPoint = json['sum_total_point'] != null && json['sum_total_point'].toString().isNotEmpty
          ? (json['sum_total_point'] is int ? json['sum_total_point'] : int.parse(json['sum_total_point']))
          : 0;
      user = List.from(json['data']).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      totalItems = 0;
      totalPages = 0;
      currentPage = 0;
      totalPoint = 0;
      user = [];
    }
  }
}
