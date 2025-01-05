class HistoryCall {
  final DateTime createdAt;
  final int callTiming;

  HistoryCall({required this.createdAt, required this.callTiming,});

  factory HistoryCall.fromJson(Map<String, dynamic> json) {
    var createdAt = DateTime.parse(json['created_at']);
    var callTiming = json['call_timing'] != null ? json['call_timing'] as int : 0;
    return HistoryCall(createdAt: createdAt, callTiming: callTiming);
  }

  Map<String, dynamic> toJson() {
    return {
      'created_at': createdAt.toIso8601String(),
      'call_timing': callTiming,
    };
  }
}
