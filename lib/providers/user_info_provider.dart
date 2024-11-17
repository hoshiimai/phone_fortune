import 'package:flutter_riverpod/flutter_riverpod.dart';

// ユーザー情報モデル
class UserInfo {
  final String name;
  final String email;
  final String nickname;
  final String furigana;
  final String gender;
  final String maritalStatus;
  final String concern;
  final String birthdate;

  UserInfo({
    this.name = '',
    this.email = '',
    this.nickname = '',
    this.furigana = '',
    this.gender = '',
    this.maritalStatus = '',
    this.concern = '',
    this.birthdate = '',
  });

  UserInfo copyWith({
    String? name,
    String? email,
    String? nickname,
    String? furigana,
    String? gender,
    String? maritalStatus,
    String? concern,
    String? birthdate,
  }) {
    return UserInfo(
      name: name ?? this.name,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      furigana: furigana ?? this.furigana,
      gender: gender ?? this.gender,
      maritalStatus: maritalStatus ?? this.maritalStatus,
      concern: concern ?? this.concern,
      birthdate: birthdate ?? this.birthdate,
    );
  }
}

// StateNotifierProvider の定義
class UserInfoNotifier extends StateNotifier<UserInfo> {
  UserInfoNotifier() : super(UserInfo());

  void updateName(String name) => state = state.copyWith(name: name);
  void updateEmail(String email) => state = state.copyWith(email: email);
  void updateNickname(String nickname) => state = state.copyWith(nickname: nickname);
  void updateFurigana(String furigana) => state = state.copyWith(furigana: furigana);
  void updateGender(String gender) => state = state.copyWith(gender: gender);
  void updateMaritalStatus(String maritalStatus) =>
      state = state.copyWith(maritalStatus: maritalStatus);
  void updateConcern(String concern) => state = state.copyWith(concern: concern);
  void updateBirthdate(String birthdate) => state = state.copyWith(birthdate: birthdate);
}

final userInfoProvider =
    StateNotifierProvider<UserInfoNotifier, UserInfo>((ref) => UserInfoNotifier());

// メールアドレス保存用の Provider
final savedEmailProvider = StateProvider<String?>((ref) => null);
