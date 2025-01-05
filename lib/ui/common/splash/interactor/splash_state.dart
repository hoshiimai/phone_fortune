part of 'splash_bloc.dart';

class SplashState extends Equatable {
  final PageState status;
  final String error;
  final PageCommand? pageCommand;

  const SplashState({
    required this.status,
    required this.error,
    this.pageCommand,
  });

  SplashState copyWith({
    PageState? status,
    String? error,
  }) {
    return SplashState(
      status: status ?? this.status,
      error: error ?? this.error,
      pageCommand: pageCommand,
    );
  }

  @override
  List<Object?> get props => [status, error, pageCommand];
}
