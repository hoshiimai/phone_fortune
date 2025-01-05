import 'package:get/get.dart';
import 'package:callmobile/core/model/enum/enum_role.dart';
import 'package:callmobile/core/model/enum/type_call.dart';
import 'package:callmobile/core/model/response/model/user.dart';
import 'package:callmobile/utils/app_shared.dart';

class Room {
  final int id;
  final int? rootId;
  final int userId;
  final int creatorId;
  final TypeCall status;
  final String? url;
  final DateTime liveAt;
  final int? callTiming;
  final int? callFee;
  final int? callFeeCreator;
  final int? totalTipAmount;
  final int? totalTipAmountCreator;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User? creator;
  final User? fan;
  final EvaluatedHistory? evaluatedHistory;
  final List<Room>? anotherFanRooms;
  final int? initialCallFeeLatest;
  final int? initialCallFee;
  final int? afterCallFeeLatest;
  final int? afterCallFee;
  final dynamic mediaData;
  final UserRoom? creatorInfo;
  final UserRoom? fanInfo;

  Room({
    required this.id,
    required this.rootId,
    required this.userId,
    required this.creatorId,
    required this.status,
    this.url,
    required this.liveAt,
    required this.callTiming,
    required this.callFee,
    required this.totalTipAmount,
    required this.callFeeCreator,
    required this.totalTipAmountCreator,
    required this.createdAt,
    required this.updatedAt,
    this.creator,
    this.fan,
    this.evaluatedHistory,
    this.anotherFanRooms,
    this.initialCallFeeLatest,
    this.initialCallFee,
    this.afterCallFeeLatest,
    this.afterCallFee,
    this.mediaData,
    this.creatorInfo,
    this.fanInfo,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      rootId: json['root_id'],
      userId: json['user_id'],
      creatorId: json['idol_id'],
      status: TypeCall.fromInt(json['status']),
      url: json['url'],
      liveAt: DateTime.parse(json['live_at']),
      callTiming: json['call_timing'] as int?,
      callFee: json['call_fee'] as int?,
      totalTipAmount: json['total_tip_amount'] as int?,
      callFeeCreator: json['call_fee_creator'] as int?,
      totalTipAmountCreator: json['total_tip_amount_creator'] as int?,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      creator: json['creator'] != null ? User.fromJson(json['creator']) : null,
      fan: json['fan'] != null ? User.fromJson(json['fan']) : null,
      evaluatedHistory: json['evaluated_history'] != null
          ? EvaluatedHistory.fromJson(json['evaluated_history'])
          : null,
      anotherFanRooms:
          (json['room_children'] != null && json['room_children'].toString().isNotEmpty)
              ? List.from(json['room_children']).map((e) => Room.fromJson(e)).toList()
              : null,
      initialCallFeeLatest: json['initial_call_fee_latest'],
      initialCallFee: json['initial_call_fee'],
      afterCallFeeLatest: json['after_call_fee_latest'],
      afterCallFee: json['after_call_fee'],
      mediaData: json['media_data'],
      creatorInfo: json['idol_room'] != null
          ? UserRoom.fromJson(json['idol_room'])
          : null,
      fanInfo: json['user_room'] != null
          ? UserRoom.fromJson(json['user_room'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'root_id': rootId,
      'user_id': userId,
      'creator_id': creatorId,
      'status': status.index,
      'url': url,
      'live_at': liveAt.toIso8601String(),
      'call_timing': callTiming,
      'call_fee': callFee,
      'call_fee_creator': callFeeCreator,
      'total_tip_amount': totalTipAmount,
      'total_tip_amount_creator': totalTipAmountCreator,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'creator': creator?.toJson(),
      'fan': fan?.toJson(),
      'evaluated_history': evaluatedHistory?.toJson(),
      'room_children': anotherFanRooms?.map((room) => room.toJson()).toList(),
      'initial_call_fee_latest': initialCallFeeLatest,
      'initial_call_fee': initialCallFee,
      'after_call_fee_latest': afterCallFeeLatest,
      'after_call_fee': afterCallFee,
      'media_data': mediaData,
    };
  }

  String getCreatorName() {
    return creator?.nickname ?? '';
  }

  String getFanNames() {
    final fanName = fan?.nickname ?? '';
    if (anotherFanRooms?.isNotEmpty ?? false) {
      final buffer = StringBuffer('$fanName, ');
      anotherFanRooms?.forEach((room) {
        buffer.write('${room.fan?.nickname ?? ''}, ');
      });
      return buffer.toString().substring(0, buffer.toString().length - 2);
    } else {
      return fanName;
    }
  }

  int getCallingTiming() {
    if (anotherFanRooms?.isNotEmpty ?? false) {
      int totalTime = callTiming ?? 0;
      anotherFanRooms?.forEach((room) {
        totalTime += (room.callTiming ?? 0);
      });
      return totalTime;
    } else {
      return callTiming ?? 0;
    }
  }

  int getCallingFee() {
    if (Get.find<AppShared>().getUser()?.role == Role.creator) {
      if (anotherFanRooms?.isNotEmpty ?? false) {
        int totalFee = callFeeCreator ?? 0;
        anotherFanRooms?.forEach((room) {
          totalFee += (room.callFeeCreator ?? 0);
        });
        return totalFee;
      } else {
        return callFeeCreator ?? 0;
      }
    } else {
      return callFee ?? 0;
    }
  }

  int getTotalTipAmount() {
    if (Get.find<AppShared>().getUser()?.role == Role.creator) {
      if (anotherFanRooms?.isNotEmpty ?? false) {
        int totalTip = totalTipAmountCreator ?? 0;
        anotherFanRooms?.forEach((room) {
          totalTip += (room.totalTipAmountCreator ?? 0);
        });
        return totalTip;
      } else {
        return totalTipAmountCreator ?? 0;
      }
    } else {
      return totalTipAmount ?? 0;
    }
  }
}

class EvaluatedHistory {
  final int? starNum;
  EvaluatedHistory({required this.starNum});

  factory EvaluatedHistory.fromJson(Map<String, dynamic> json) {
    return EvaluatedHistory(
      starNum: json['star_num'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'star_num': starNum,
    };
  }
}

class UserRoom {
  final String fullName;
  final String? avatarFilePath;
  UserRoom({required this.fullName, required this.avatarFilePath});

  factory UserRoom.fromJson(Map<String, dynamic> json) {
    return UserRoom(
      fullName: json['fullname'] as String,
      avatarFilePath: json['avatar'] != null ? json['avatar']['file_path'] as String : null,
    );
  }
}
