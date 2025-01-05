import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_event_transformers/bloc_event_transformers.dart';
import 'package:callmobile/core/repository/interface/i_call_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/enum/type_call.dart';
import '../../../../core/model/response/error_from_server.dart';
import '../../../../core/model/response/model/room.dart';
import '../../../../core/repository/interface/i_auth_repository.dart';
import '../../../../utils/app_utils.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';

part 'history_chat_event.dart';
part 'history_chat_state.dart';

class HistoryChatBloc extends Bloc<HistoryChatEvent, HistoryChatState> {

  final ICallRepository callRepository;

  HistoryChatBloc({required this.callRepository,})
      : super(const HistoryChatState(error: '', status: PageState.initial)) {
    on<Init>(_onInit);
    on<OnLoadHistory>(_onLoadHistory, transformer: throttle(const Duration(seconds: 1)));
  }

  FutureOr<void> _onInit(Init event, Emitter<HistoryChatState> emit) async {
    emit(state.copyWith(status: PageState.loadingFull));

    final response = await _fetchRoomHistory(1, null);

    response.fold(
      (error) => _handleError(error, emit, PageState.failure),
      (rooms) =>
          _handleSuccess(roomsRsp: rooms, emit: emit, status: PageState.success),
    );
  }

  FutureOr<void> _onLoadHistory(OnLoadHistory event, Emitter<HistoryChatState> emit) async {
    emit(state.copyWith(loadMoreStatus: PageState.loading, isRefresh: event.isReset));

    // Fetch new call history
    if(event.fromDateTime != null) {
      final response = await _fetchRoomHistory(1, event.fromDateTime);
      response.fold((error) {

      }, (roomsRsp) {
        final rooms = filterRooms(roomsRsp);
        final mergedRooms = (List<Room>.from(state.rooms)..addAll(rooms));
        final sortedRooms = _sortRoomsByDate(mergedRooms);

        emit(state.copyWith(
            loadMoreStatus: PageState.success,
            groupRoomsByDate: groupRoomsByDate(sortedRooms),
            rooms: sortedRooms,
            totalPages: state.totalPages,
            totalCount: state.totalCount + rooms.length,
            currentPage: state.currentPage));
      });
      return;
    }

    final isFetchedAll = state.totalPages == state.currentPage;
    if (!event.isReset && isFetchedAll) {
      emit(state.copyWith(status: PageState.initial, isRefresh: false));
      return;
    }

    final currentPage = event.isReset ? 1 : state.currentPage + 1;
    final response = await _fetchRoomHistory(currentPage, null);

    response.fold(
      (error) => _handleError(error, emit, PageState.failure),
      (rooms) => _handleLoadMoreSuccess(
          roomsRsp: rooms, emit: emit, isReset: event.isReset),
    );
  }

  Future<Either<ErrorFromServer, List<Room>>> _fetchRoomHistory(int page, DateTime? fromDateTime) async {
    return callRepository.getCallHistory();
  }

  void _handleError(ErrorFromServer error, Emitter<HistoryChatState> emit, PageState status) {
    // showErrorToast(error.message);
    emit(state.copyWith(status: status));
  }

  void _handleSuccess({
    required List<Room> roomsRsp,
    required Emitter<HistoryChatState> emit,
    required PageState status,
  }) {
    final rooms = _sortRoomsByDate(filterRooms(roomsRsp));
    emit(state.copyWith(
        status: status,
        groupRoomsByDate: groupRoomsByDate(rooms),
        rooms: rooms,
        totalPages: 1,
        totalCount: roomsRsp.length,
        currentPage: 1));
  }

  void _handleLoadMoreSuccess({
    required List<Room> roomsRsp,
    required Emitter<HistoryChatState> emit,
    required bool isReset,
  }) {
    final rooms = filterRooms(roomsRsp);
    final mergedRooms = isReset ? rooms : (List<Room>.from(state.rooms)..addAll(rooms));
    final sortedRooms = _sortRoomsByDate(mergedRooms);

    emit(state.copyWith(
        loadMoreStatus: PageState.success,
        groupRoomsByDate: groupRoomsByDate(sortedRooms),
        rooms: sortedRooms,
        totalPages: 1,
        totalCount: roomsRsp.length,
        currentPage: 1));
  }

  List<Room> filterRooms(List<Room> rooms) {
    return rooms
        .where((e) => e.status == TypeCall.finished || e.status == TypeCall.cancel)
        .toList();
  }

  List<Room> _sortRoomsByDate(List<Room> rooms) {
    return rooms
      ..sort((room1, room2) =>
          room2.createdAt.microsecondsSinceEpoch - room1.createdAt.microsecondsSinceEpoch);
  }

  Map<String, List<Room>> groupRoomsByDate(List<Room> rooms) {
    final groupedRooms = <String, List<Room>>{};

    for (var room in rooms) {
      final formattedDate =
          '${AppUtils.formatDate(room.createdAt.toLocal(), format: AppUtils.yyyyMMdd)} (${AppUtils.getDayOfWeek(room.createdAt.toLocal())})';
      groupedRooms.putIfAbsent(formattedDate, () => []).add(room);
    }

    return groupedRooms;
  }
}
