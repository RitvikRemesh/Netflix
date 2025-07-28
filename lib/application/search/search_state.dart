part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
   factory SearchState({
    required List<SerchResultData> searchResultList,
    required List<Downloads> idleList,
    required bool isLoading,
    required bool isError,
  }) =  _SearchState;

  factory SearchState.initial() =>  SearchState(
    searchResultList: [],
    idleList: [],
    isLoading: false,
    isError: false,
  );
}
