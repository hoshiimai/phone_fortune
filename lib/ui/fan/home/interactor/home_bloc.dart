import 'dart:async';

import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
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
  final IAuthRepository authRepository;
  final MainBloc mainBloc;
  HomeBloc({required this.mainBloc, required this.authRepository,})
      : super(const HomeState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnGetListIdol>(_onGetListIdol);
  }

  FutureOr<void> _onInit(Init event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      currentLoggedInUser: Get.find<AppShared>().getUser(),
      status: PageState.success,
    ));
    add(OnGetListIdol(isRefresh: event.isRefresh));
  }

  FutureOr<void> _onGetListIdol(OnGetListIdol event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      status: event.isRefresh ? PageState.success : PageState.loading,
    ));

    final response = await authRepository.getListCreator();
    response.fold((error) {

    }, (creators) {
      emit(state.copyWith(creators: creators, status: PageState.success));
    });
  }
}
