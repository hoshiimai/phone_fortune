part of 'history_chat_bloc.dart';

class HistoryChatState extends Equatable {
  final PageState status;
  final PageState loadMoreStatus;
  final String error;
  final PageCommand? pageCommand;
  final Map<String, List<Room>> groupRoomsByDate;
  final List<Room> rooms;
  final int totalCount;
  final int currentPage;
  final int totalPages;
  final bool isRefresh;

  const HistoryChatState({
    required this.status,
    required this.error,
    this.loadMoreStatus = PageState.initial,
    this.pageCommand,
    this.groupRoomsByDate = const {},
    this.rooms = const [],
    this.totalCount = 0,
    this.currentPage = 1,
    this.totalPages = 0,
    this.isRefresh = false,
  });

  HistoryChatState copyWith({
    PageState? status,
    PageState? loadMoreStatus,
    String? error,
    PageCommand? pageCommand,
    Map<String, List<Room>>? groupRoomsByDate,
    List<Room>? rooms,
    int? totalCount,
    int? currentPage,
    int? totalPages,
    bool? isRefresh,
  }) {
    return HistoryChatState(
      status: status ?? this.status,
      loadMoreStatus: loadMoreStatus ?? this.loadMoreStatus,
      error: error ?? this.error,
      pageCommand: pageCommand ?? this.pageCommand,
      groupRoomsByDate: groupRoomsByDate ?? this.groupRoomsByDate,
      rooms: rooms ?? this.rooms,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      isRefresh: isRefresh ?? this.isRefresh,
    );
  }

  @override
  List<Object?> get props => [
    status,
    loadMoreStatus,
    error,
    pageCommand,
    groupRoomsByDate,
    rooms,
    totalCount,
    currentPage,
    totalPages,
    isRefresh,
  ];
}