import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix1/domain/core/failures/main_failure.dart';
import 'package:netflix1/domain/hot_and_new_resp/model/hot_and_new_resp.dart';
import 'package:netflix1/domain/hot_and_new_resp/hot_and_new_service.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;
  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    // get hot and new movie data
    on<LoadDataIncommingSoon>((event, emit) async {
      // send loading to ui

      emit(
        const HotAndNewState(
          commingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();

      // get data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            commingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            commingSoonList: resp.results,
            everyOneIsWatchingList: state.everyOneIsWatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });

    // get hot and new tv data
    on<LoadDataInEveryoneIsWtching>((event, emit) async {
      emit(
        const HotAndNewState(
          commingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewTVData();

      // get data to state
      final newState = _result.fold(
        (MainFailure failure) {
          return const HotAndNewState(
            commingSoonList: [],
            everyOneIsWatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
            commingSoonList: state.commingSoonList,
            everyOneIsWatchingList: resp.results,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
