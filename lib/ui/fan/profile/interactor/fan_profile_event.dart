part of 'fan_profile_bloc.dart';

abstract class FanProfileEvent extends Equatable {
  const FanProfileEvent();
}

class Init extends FanProfileEvent {
  final User? user;
  const Init(this.user);

  @override
  List<Object?> get props => [user];
}

class OnClearPageCommand extends FanProfileEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}
