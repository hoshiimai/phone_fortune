part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class Init extends SplashEvent {
  const Init();

  @override
  List<Object> get props => [];
}
class OnClearPageCommand extends SplashEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}