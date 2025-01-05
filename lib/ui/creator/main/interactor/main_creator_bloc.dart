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

part 'main_creator_event.dart';
part 'main_creator_state.dart';
part 'main_creator_bloc.freezed.dart';

class MainCreatorBloc extends Bloc<MainCreatorEvent, MainCreatorState> {
  final IAuthRepository authRepository;
  CupertinoTabController tabController = CupertinoTabController();
  final List<GlobalKey<NavigatorState>> tabNavKeys = List.generate(
      creatorPages.length, (_) => GlobalKey<NavigatorState>());

  MainCreatorBloc({required this.authRepository,})
      : super(const MainCreatorState(error: '', status: PageState.loading)) {
    on<OnChangeTabEvent>(_onChangeTabEvent);
    on<OnGetUserDetail>(_onGetUserDetail);
    on<OnUpdateCreator>(_onUpdateCreator);
    on<ResetPopPageCreator>(_onResetPopPage);
    on<OnGetCreatorDetail>(_onGetCreatorDetail);
    on<OnPageNavigation>(_onPageNavigation);
    on<OnClearPageNavigation>(_onClearPageNavigation);
    on<OnUpdateWaitingCount>(_onUpdateWaitingCount);
  }

  FutureOr<void> _onPageNavigation(OnPageNavigation event, Emitter<MainCreatorState> emit) {
    emit(state.copyWith(pageNavigation: event.pageNavigation));
  }

  FutureOr<void> _onClearPageNavigation(OnClearPageNavigation event, Emitter<MainCreatorState> emit) {
    emit(state.copyWith(pageNavigation: null));
  }

  FutureOr<void> _onResetPopPage(
      ResetPopPageCreator event, Emitter<MainCreatorState> emit) {
    emit(state.copyWith(popPage: null));
  }

  FutureOr<void> _onChangeTabEvent(
      OnChangeTabEvent event, Emitter<MainCreatorState> emit) {
    if(state.currentPage == event.tab) {
      emit(state.copyWith(popPage: event.tab));
    } else {
      emit(state.copyWith(currentPage: event.tab));
    }
  }

  FutureOr<void> _onGetUserDetail(
      OnGetUserDetail event, Emitter<MainCreatorState> emit) async {
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

    // await Get.find<FirebaseMessagingManager>().fetchAndSaveFcmToken();
    // final fcmToken = appShared.getTokenFcm();
    // if(fcmToken?.isNotEmpty ?? false) {
    //   authRepository.updateFcmToken(fcmToken: fcmToken!);
    // }

    // final responseNotification =
    //     await notificationRepository.getNotificationUnread();
    // responseNotification.fold((error) {}, (notification) {
    //   appShared.setNotificationUnread(notification.isNotifyUnread);
    // });
  }

  FutureOr<void> _onUpdateCreator(OnUpdateCreator event, Emitter<MainCreatorState> emit) async {
    emit(state.copyWith(creatorUpdate: event.creatorUpdate));
    await Future.delayed(const Duration(milliseconds: 100));
    //Reset creator to prevent update multiple time
    emit(state.copyWith(creatorUpdate: null));
  }

  FutureOr<void> _onGetCreatorDetail(
      OnGetCreatorDetail event, Emitter<MainCreatorState> emit) async {
    // final response = await authRepository.getCreatorDetail(event.creatorId);
    // response.fold((error) {}, (creator) {
    //   add(OnUpdateCreator(CreatorUpdate(updateType: CreatorUpdateType.general, creator: creator)));
    //   event.onGetCreatorSuccess?.call(creator);
    // });
  }


  FutureOr<void> _onUpdateWaitingCount(
      OnUpdateWaitingCount event, Emitter<MainCreatorState> emit) {
    emit(state.copyWith(waitingCount: event.count));
  }
}
