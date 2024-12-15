part of 'setting_bloc.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();
}

class Init extends SettingEvent {
  const Init();

  @override
  List<Object> get props => [];
}

class OnClearPageCommand extends SettingEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
