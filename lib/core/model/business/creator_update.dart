import 'package:callmobile/core/model/business/creator_update_type.dart';

import '../response/model/user.dart';

class CreatorUpdate {
  final CreatorUpdateType updateType;
  final User creator;

  CreatorUpdate({
    required this.updateType,
    required this.creator,
  });
}
