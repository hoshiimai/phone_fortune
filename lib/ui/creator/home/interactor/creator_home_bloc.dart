import 'dart:async';

import 'package:callmobile/core/model/business/creator_status.dart';
import 'package:callmobile/ui/creator/main/interactor/main_creator_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'creator_home_event.dart';
part 'creator_home_state.dart';

class CreatorHomeBloc extends Bloc<CreatorHomeEvent, CreatorHomeState> {
  final MainCreatorBloc mainBloc;
  CreatorHomeBloc({required this.mainBloc})
      : super(const CreatorHomeState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnUpdateStatus>(_onUpdateStatus);
  }

  FutureOr<void> _onInit(Init event, Emitter<CreatorHomeState> emit) async {
    emit(state.copyWith(
      currentLoggedInUser: Get.find<AppShared>().getUser(),
      status: PageState.success,
    ));
  }

  FutureOr<void> _onUpdateStatus(OnUpdateStatus event, Emitter<CreatorHomeState> emit) async {
    emit(state.copyWith(
      currentStatus: event.status,
    ));
  }
}
