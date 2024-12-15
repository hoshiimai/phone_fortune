import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';
import '../../main/interactor/main_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MainBloc mainBloc;
  HomeBloc({required this.mainBloc})
      : super(const HomeState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
  }

  FutureOr<void> _onInit(Init event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      currentLoggedInUser: Get.find<AppShared>().getUser(),
      status: PageState.success,
    ));
  }
}
