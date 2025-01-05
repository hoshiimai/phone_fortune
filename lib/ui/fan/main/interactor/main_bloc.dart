import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart' hide CupertinoTabScaffold, CupertinoTabController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import '../../../../core/model/business/creator_update.dart';
import '../../../../core/model/business/page_navigation.dart';
import '../../../../core/model/enum/enum_bottom_navigation_page.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../utils/app_shared.dart';
import '../../../base/interactor/page_states.dart';
import '../../../widgets/app_tab_scaffold.dart';

part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final IAuthRepository authRepository;
  CupertinoTabController tabController = CupertinoTabController();
  final List<GlobalKey<NavigatorState>> tabNavKeys = List.generate(
      fanPages.length, (_) => GlobalKey<NavigatorState>());

  MainBloc({required this.authRepository,})
      : super(const MainState(error: '', status: PageState.loading)) {
    on<OnChangeTabEvent>(_onChangeTabEvent);
    on<OnGetUserDetail>(_onGetUserDetail);
    on<OnUpdateCreator>(_onUpdateCreator);
    on<ResetPopPage>(_onResetPopPage);
    on<OnGetCreatorDetail>(_onGetCreatorDetail);
    on<OnPageNavigation>(_onPageNavigation);
    on<OnClearPageNavigation>(_onClearPageNavigation);

  }

  FutureOr<void> _onPageNavigation(OnPageNavigation event, Emitter<MainState> emit) {
    emit(state.copyWith(pageNavigation: event.pageNavigation));
  }

  FutureOr<void> _onClearPageNavigation(OnClearPageNavigation event, Emitter<MainState> emit) {
    emit(state.copyWith(pageNavigation: null));
  }

  FutureOr<void> _onResetPopPage(
      ResetPopPage event, Emitter<MainState> emit) {
    emit(state.copyWith(popPage: null));
  }

  FutureOr<void> _onChangeTabEvent(
      OnChangeTabEvent event, Emitter<MainState> emit) {
    if(state.currentPage == event.tab) {
      emit(state.copyWith(popPage: event.tab));
    } else {
      emit(state.copyWith(currentPage: event.tab));
    }
  }

  FutureOr<void> _onGetUserDetail(
      OnGetUserDetail event, Emitter<MainState> emit) async {
    final appShared = Get.find<AppShared>();
    final response =
        await authRepository.getProfile();
    response.fold((error) {}, (user) {
      appShared.setUser(user);
      emit(state.copyWith(
        user: user,
      ));
      event.onGetUserSuccess?.call(user);
    });
  }

  FutureOr<void> _onUpdateCreator(OnUpdateCreator event, Emitter<MainState> emit) async {
    emit(state.copyWith(creatorUpdate: event.creatorUpdate));
    await Future.delayed(const Duration(milliseconds: 100));
    //Reset creator to prevent update multiple time
    emit(state.copyWith(creatorUpdate: null));
  }

  FutureOr<void> _onGetCreatorDetail(
      OnGetCreatorDetail event, Emitter<MainState> emit) async {
    // final response = await authRepository.getCreatorDetail(event.creatorId);
    // response.fold((error) {}, (creator) {
    //   add(OnUpdateCreator(CreatorUpdate(updateType: CreatorUpdateType.general, creator: creator)));
    //   event.onGetCreatorSuccess?.call(creator);
    // });
  }
}
