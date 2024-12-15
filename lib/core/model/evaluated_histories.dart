class EvaluatedHistory {
  final int? id;
  final int roomId;
  final List<int> userId;
  final int evaluatedUserId;
  final int starNum;
  final DateTime createdAt;
  final int createdUser;
  final DateTime updatedAt;
  final int updatedUser;

  EvaluatedHistory({
    this.id,
    required this.roomId,
    required this.userId,
    required this.evaluatedUserId,
    required this.starNum,
    required this.createdAt,
    required this.createdUser,
    required this.updatedAt,
    required this.updatedUser,
  });

  factory EvaluatedHistory.fromJson(Map<String, dynamic> json) {
    return EvaluatedHistory(
      id: json['id'],
      roomId: json['room_id'],
      userId: json['user_id'],
      evaluatedUserId: json['evaluated_user_id'],
      starNum: json['star_num'],
      createdAt: DateTime.parse(json['created_at']),
      createdUser: json['created_user'],
      updatedAt: DateTime.parse(json['updated_at']),
      updatedUser: json['updated_user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'room_id': roomId,
      'user_id': userId,
      'evaluated_user_id': evaluatedUserId,
      'star_num': starNum,
      'created_at': createdAt.toIso8601String(),
      'created_user': createdUser,
      'updated_at': updatedAt.toIso8601String(),
      'updated_user': updatedUser,
    };
  }

  EvaluatedHistory copyWith({
    int? id,
    int? roomId,
    List<int>? userId,
    int? evaluatedUserId,
    int? starNum,
    DateTime? createdAt,
    int? createdUser,
    DateTime? updatedAt,
    int? updatedUser,
  }) {
    return EvaluatedHistory(
      id: id ?? this.id,
      roomId: roomId ?? this.roomId,
      userId: userId ?? this.userId,
      evaluatedUserId: evaluatedUserId ?? this.evaluatedUserId,
      starNum: starNum ?? this.starNum,
      createdAt: createdAt ?? this.createdAt,
      createdUser: createdUser ?? this.createdUser,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedUser: updatedUser ?? this.updatedUser,
    );
  }
}
