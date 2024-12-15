import 'model/point_form_user.dart';

class PointFromUserMonth {
  final List<PointFormUser> pointsFormUser;
  final int month;
  final int totalPoint;
  bool isExpanded;

  PointFromUserMonth({
    required this.pointsFormUser,
    required this.month,
    required this.totalPoint,
    this.isExpanded = false,
  });

  factory PointFromUserMonth.fromJson(Map<String, dynamic> json) {
    return PointFromUserMonth(
      pointsFormUser: (json['pointsFormUser'] as List)
          .map((point) => PointFormUser.fromJson(point as Map<String, dynamic>))
          .toList(),
      month: json['month'] as int,
      totalPoint: json['totalPoint'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pointsFormUser': pointsFormUser.map((point) => point.toJson()).toList(),
      'month': month,
      'totalPoint': totalPoint,
    };
  }

  PointFromUserMonth copyWith({
    List<PointFormUser>? pointsFormUser,
    int? month,
    int? totalPoint,
  }) {
    return PointFromUserMonth(
      pointsFormUser: pointsFormUser ?? this.pointsFormUser,
      month: month ?? this.month,
      totalPoint: totalPoint ?? this.totalPoint,
    );
  }
}
