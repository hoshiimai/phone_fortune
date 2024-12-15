part of 'personal_info_edit_bloc.dart';

abstract class PersonalInfoEditEvent extends Equatable {
  const PersonalInfoEditEvent();
}

class Init extends PersonalInfoEditEvent {
  final Function(User? user) onInitSuccess;
  const Init({required this.onInitSuccess});

  @override
  List<Object> get props => [];
}

class OnChangeFullName extends PersonalInfoEditEvent {
  final String name;
  const OnChangeFullName(this.name);

  @override
  List<Object> get props => [name];
}

class OnChangeKataName extends PersonalInfoEditEvent {
  final String name;
  const OnChangeKataName(this.name);

  @override
  List<Object> get props => [name];
}

class OnChangePhoneNumber extends PersonalInfoEditEvent {
  final String phoneNumber;
  const OnChangePhoneNumber(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class OnChangeBirthDate extends PersonalInfoEditEvent {
  final DateTime birthDate;
  const OnChangeBirthDate(this.birthDate);

  @override
  List<Object> get props => [birthDate];
}

class OnSubmitPersonalInfo extends PersonalInfoEditEvent {
  final Function() onUpdatePersonalInfoSuccess;
  const OnSubmitPersonalInfo({required this.onUpdatePersonalInfoSuccess});

  @override
  List<Object> get props => [onUpdatePersonalInfoSuccess];
}

