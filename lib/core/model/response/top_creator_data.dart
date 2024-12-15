import 'model/list_creator_model.dart';
import 'model/user.dart';

class TopCreatorData {
  late final List<User> managedCreators;
  late final List<User> likedCreators;
  late final List<User> callingCreators;
  late final List<User> potentialCreators;

  TopCreatorData(
      {required this.managedCreators,
      required this.likedCreators,
      required this.callingCreators,
      required this.potentialCreators});

  TopCreatorData.fromJson(Map<String, dynamic> json) {
    try {
      managedCreators = json['list_managed'] != null ? ListCreatorModel.fromJson(json['list_managed']).creators : [];
      likedCreators = json['list_like'] != null ? ListCreatorModel.fromJson(json['list_like']).creators : [];
      callingCreators = json['list_calling'] != null ? ListCreatorModel.fromJson(json['list_calling'] ).creators : [];
      potentialCreators = json['list_potential'] != null ? ListCreatorModel.fromJson(json['list_potential']).creators : [];
    } catch (e) {
      managedCreators = [];
      likedCreators = [];
      callingCreators = [];
      potentialCreators = [];
    }
  }
}
