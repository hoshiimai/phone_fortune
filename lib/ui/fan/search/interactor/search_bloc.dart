import 'dart:async';

import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/business/creator_status.dart';
import '../../../../core/model/response/model/user.dart';
import '../../../base/interactor/page_command.dart';
import '../../../base/interactor/page_states.dart';
import '../../main/interactor/main_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MainBloc mainBloc;

  SearchBloc({required this.mainBloc})
      : super(const SearchState(error: '', loadingState: PageState.initial)) {
    on<Init>(_onInit);
    on<OnSearch>(_onSearch);
    on<OnLoadMore>(_onLoadMore);
  }

  FutureOr<void> _onInit(Init event, Emitter<SearchState> emit) async {
  }

  FutureOr<void> _onSearch(OnSearch event, Emitter<SearchState> emit) async {
    emit(state.copyWith(loadingState: PageState.loading));
    await Future.delayed(const Duration(seconds: 1));
    if(event.text.isEmpty) {
      emit(state.copyWith(keyword: event.text, creators: [],  loadingState: PageState.success,));
    } else {
      emit(state.copyWith(
        keyword: event.text,
        creators: [
          Creator(name: '名前', comment: 'コメント', waitingFanCount: 10, status: CreatorStatus.away),
          Creator(name: '名前', comment: 'コメント', waitingFanCount: 1, status: CreatorStatus.away),
          Creator(name: '名前', comment: 'コメント', waitingFanCount: 6, status: CreatorStatus.away),
          Creator(name: '名前', comment: 'コメント', waitingFanCount: 0, status: CreatorStatus.available),
          Creator(name: '名前', comment: 'コメント', waitingFanCount: 0, status: CreatorStatus.offline),
          Creator(name: '名前', comment: 'コメント', waitingFanCount: 0, status: CreatorStatus.offline),
          Creator(name: '名前', comment: 'コメント', waitingFanCount: 0, status: CreatorStatus.offline),
        ],
        loadingState: PageState.success,));
    }
  }

  FutureOr<void> _onLoadMore(OnLoadMore event, Emitter<SearchState> emit) async {

  }
}
