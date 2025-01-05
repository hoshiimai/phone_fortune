import 'dart:async';

import 'package:callmobile/core/model/response/model/creator.dart';
import 'package:callmobile/core/repository/interface/i_auth_repository.dart';
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
  final IAuthRepository authRepository;
  final MainBloc mainBloc;

  SearchBloc({required this.mainBloc, required this.authRepository,})
      : super(const SearchState(error: '', loadingState: PageState.initial)) {
    on<Init>(_onInit);
    on<OnSearch>(_onSearch);
    on<OnLoadMore>(_onLoadMore);
  }

  FutureOr<void> _onInit(Init event, Emitter<SearchState> emit) async {
  }

  FutureOr<void> _onSearch(OnSearch event, Emitter<SearchState> emit) async {
    emit(state.copyWith(loadingState: PageState.loading));
    final response = await authRepository.searchCreators(keyword: event.text, page: 1);
    response.fold((error) {
      emit(state.copyWith(loadingState: PageState.failure));
      //TODO: handle error
    }, (data) {
      emit(state.copyWith(
          keyword: event.text,
          creators: data.creators,
          loadingState: PageState.success,
          currentPage: data.currentPage,
          totalPage: data.totalPages,
          totalCreators: data.totalItems));
    });
  }

  FutureOr<void> _onLoadMore(OnLoadMore event, Emitter<SearchState> emit) async {
    if (state.creators.length == state.totalCreators) {
      return;
    }
    emit(state.copyWith(loadingMoreState: PageState.loading));
    final response = await authRepository.searchCreators(
        keyword: state.keyword ?? '', page: state.currentPage + 1);
    response.fold((error) {
      emit(state.copyWith(loadingMoreState: PageState.failure));
      //TODO: handle error
    }, (data) {
      emit(state.copyWith(
          creators: List.from(state.creators)..addAll(data.creators),
          currentPage: data.currentPage,
          loadingMoreState: PageState.success));
    });
  }
}
