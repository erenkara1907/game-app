// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:game_introduction_app/model/data_model.dart';
import 'package:game_introduction_app/repository/game_repository.dart';
import 'package:meta/meta.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final GameRepository gameRepository;

  GameDataBloc(this.gameRepository) : super(GameDataInitialState()) {
    on<GameDataEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameDataLoadingState());
        List<DataModel>? apiResult = await gameRepository.getGamesData();
        if (apiResult == null) {
          emit(GameDataErrorState());
        } else {
          emit(GameDataLoadedState(apiResult: apiResult));
        }
      }
    });
  }
}
