class PointSettingModel {
  final int? initCallTime;
  final int? initCallFee;
  final int? afterCallTime;
  final int? afterCallFee;

  PointSettingModel({
    this.initCallTime,
    this.initCallFee,
    this.afterCallTime,
    this.afterCallFee,
  });

  factory PointSettingModel.fromJson(Map<String, dynamic> json) {
    return PointSettingModel(
      initCallTime: json['initial_call_timing'],
      initCallFee: json['initial_call_fee'],
      afterCallTime: json['after_call_timing'],
      afterCallFee: json['after_call_fee'],
    );
  }
}
