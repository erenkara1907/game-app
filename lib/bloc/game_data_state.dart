part of 'game_data_bloc.dart';

@immutable
abstract class GameDataState {}

class GameDataInitialState extends GameDataState {}

class GameDataLoadingState extends GameDataState {}

class GameDataLoadedState extends GameDataState {
  final List<DataModel> apiResult;

  GameDataLoadedState({required this.apiResult});
}

class GameDataErrorState extends GameDataState {}
