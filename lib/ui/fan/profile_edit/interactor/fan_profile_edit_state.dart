part of 'fan_profile_edit_bloc.dart';

class FanProfileEditState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;
  final String name;
  final String validName;
  final String welcomeMessage;
  // currentLoginUser can be Fan or Creator
  final User? currentLoginUser;
  final GenderType? gender;
  final DateTime? birthDate;
  final File? avatar;

  const FanProfileEditState({
    required this.status,
    required this.error,
    this.pageCommand,
    this.name = '',
    this.validName = '',
    this.welcomeMessage = '',
    this.currentLoginUser,
    this.gender = GenderType.male,
    this.birthDate,
    this.avatar,
  });

  FanProfileEditState copyWith({
    PageState? status,
    String? error,
    List<String>? languages,
    String? languageSelected,
    String? name,
    String? validName,
    String? welcomeMessage,
    User? currentLoginUser,
    GenderType? gender,
    DateTime? birthDate,
    File? avatar,
  }) {
    return FanProfileEditState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
      name: name ?? this.name,
      validName: validName ?? this.validName,
      welcomeMessage: welcomeMessage ?? this.welcomeMessage,
      currentLoginUser: currentLoginUser ?? this.currentLoginUser,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      avatar: avatar ?? this.avatar,
    );
  }

  @override
  List<Object?> get props =>
      [status, error, pageCommand, name, validName, welcomeMessage, currentLoginUser, gender, birthDate, avatar,];
}
