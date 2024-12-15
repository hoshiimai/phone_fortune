class CompleteRegisterRequest {
  final int role;
  final String fcmToken;
  final String? nameKata;
  final String? fullName;
  final String? birth;
  final String? tel;
  final String? bankCode;
  final String? branchName;
  final String? branchCode;
  final String? number;
  final String? firstname;
  final String? lastname;
  final int? initCallTime;
  final int? initCallFee;
  final int? afterCallTime;
  final int? afterCallFee;
  final String? url;
  int? creatorId;
  int? agentId;
  final String lang;

  CompleteRegisterRequest(
      {required this.role,
      required this.fcmToken,
      this.nameKata,
      this.fullName,
      this.birth,
      this.tel,
      this.bankCode,
      this.branchName,
      this.branchCode,
      this.number,
      this.firstname,
      this.lastname,
      this.initCallTime,
      this.initCallFee,
      this.afterCallTime,
      this.afterCallFee,
      this.url,
      this.creatorId,
      this.agentId,
      required this.lang});

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'fcmToken': fcmToken,
      'name': fullName,
      'nameKata': nameKata,
      'birth': birth,
      'tel': tel,
      'bankCode': bankCode,
      'branchName': branchName,
      'branchCode': branchCode,
      'number': number,
      'firstname': firstname,
      'lastname': lastname,
      'initCallTime': initCallTime,
      'initCallFee': initCallFee,
      'afterCallTime': afterCallTime,
      'afterCallFee': afterCallFee,
      'url': url,
      'creatorId': creatorId,
      'agentId': agentId,
      'lang': lang
    };
  }
}
