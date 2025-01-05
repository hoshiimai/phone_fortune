part of 'fan_profile_bloc.dart';

abstract class FanProfileEvent extends Equatable {
  const FanProfileEvent();
}

class Init extends FanProfileEvent {
  const Init();

  @override
  List<Object?> get props => [];
}

class OnClearPageCommand extends FanProfileEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
