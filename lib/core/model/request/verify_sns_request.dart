import 'package:callmobile/core/model/request/model/user_info.dart';

import '../enum/enum_sns.dart';

class VerifySnsRequest {
  String? token;
  String? tokenSecret;
  Sns type;
  UserInfo? userInfo;
  bool isIos;

  VerifySnsRequest({
    required this.token,
    required this.tokenSecret,
    required this.type,
    required this.userInfo,
    required this.isIos,
  });

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'tokenSecret': tokenSecret,
      'type': type.toInt(),
      'userInfo': userInfo?.toJson(),
      'isIos': isIos,
    };
  }
}
