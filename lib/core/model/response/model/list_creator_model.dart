import 'user.dart';

class ListCreatorModel {
  late final List<User> creators;
  ListCreatorModel(this.creators);

  ListCreatorModel.fromJson(Map<String, dynamic> json) {
    try {
      creators = List.from(json['data']).map((e) => User.fromJson(e)).toList();
    } catch (e) {
      creators = [];
    }
  }
}
