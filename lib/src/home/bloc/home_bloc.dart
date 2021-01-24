import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bored_repository/bored_repository.dart';
import 'package:equatable/equatable.dart';

import '../models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._boredRepository)
      : assert(_boredRepository != null, 'repository missed'),
        super(const HomeState.initial());

  final BoredRepository _boredRepository;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is SearchRandom) {
      yield* _mapSearchRandomToState(event, state);
    }
  }

  Stream<HomeState> _mapSearchRandomToState(
    SearchRandom event,
    HomeState state,
  ) async* {
    yield const HomeState.loading();

    try {
      final result = await _boredRepository.getRandom();
      final idea = Idea(activity: result.activity);
      yield HomeState.success(idea);
    } on Exception {
      yield const HomeState.failure();
    }
  }
}
