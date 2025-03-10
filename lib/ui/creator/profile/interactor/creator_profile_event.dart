part of 'creator_profile_bloc.dart';

abstract class CreatorProfileEvent extends Equatable {
  const CreatorProfileEvent();
}

class Init extends CreatorProfileEvent {
  final User? creator;
  const Init(this.creator);

  @override
  List<Object?> get props => [creator];
}

class OnTapHeart extends CreatorProfileEvent {
  final Function(User) onUpdateFavoriteSuccess;
  const OnTapHeart({required this.onUpdateFavoriteSuccess});

  @override
  List<Object> get props => [onUpdateFavoriteSuccess];
}

class OnTapBlock extends CreatorProfileEvent {
  final Function(User) onBlockSuccess;
  const OnTapBlock({required this.onBlockSuccess});

  @override
  List<Object> get props => [onBlockSuccess];
}

class OnTapReport extends CreatorProfileEvent {
  final String reason;
  const OnTapReport(this.reason);
  @override
  List<Object> get props => [reason];
}

class OnClearPageCommand extends CreatorProfileEvent {
  const OnClearPageCommand();

  @override
  List<Object> get props => [];
}

class OnGetCreatorDetail extends CreatorProfileEvent {
  final int creatorId;
  const OnGetCreatorDetail({required this.creatorId});

  @override
  List<Object> get props => [creatorId];
}

class OnRegisterCall extends CreatorProfileEvent {
  final int creatorId;
  final Function onRegisterSuccess;
  const OnRegisterCall({required this.creatorId, required this.onRegisterSuccess});

  @override
  List<Object> get props => [creatorId, onRegisterSuccess];
}
