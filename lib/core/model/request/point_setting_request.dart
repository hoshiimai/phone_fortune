class PointSettingRequest {
  final int? initCallTime;
  final int? initCallFee;
  final int? afterCallTime;
  final int? afterCallFee;

  PointSettingRequest({
    this.initCallTime,
    this.initCallFee,
    this.afterCallTime,
    this.afterCallFee,
  });

  Map<String, dynamic> toJson() {
    return {
      'initCallTime': initCallTime,
      'initCallFee': initCallFee,
      'afterCallTime': afterCallTime,
      'afterCallFee': afterCallFee,
    };
  }
}
