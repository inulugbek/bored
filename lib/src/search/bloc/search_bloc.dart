import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bored_repository/bored_repository.dart';
import 'package:equatable/equatable.dart';

import '../search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._boredRepository)
      : assert(_boredRepository != null, 'repository missed'),
        super(const SearchState.initial());

  final BoredRepository _boredRepository;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is GetCategories) {
      yield* _mapGetCategoriesToState(event, state);
    } else if (event is SearchCategory) {
      yield* _mapSearchCategoryToState(event, state);
    }
  }

  Stream<SearchState> _mapGetCategoriesToState(
    GetCategories event,
    SearchState state,
  ) async* {
    yield const SearchState.loading();

    try {
      final result = await _boredRepository.getActivityTypes();

      final categories = result
          .map<ActivityCategory>((data) => data.toActivityCategory())
          .toList();

      yield SearchState.initial(
        categories: categories,
      );
    } on Exception {
      yield const SearchState.noCategories();
    }
  }

  Stream<SearchState> _mapSearchCategoryToState(
    SearchCategory event,
    SearchState state,
  ) async* {
    yield const SearchState.loading();

    try {
      final type = _fromCategoryToType(event.category);

      Activity result;

      if (type == null) {
        // category was not mapped to domain type
        result = await _boredRepository.getRandom();
      } else {
        result = await _boredRepository.getByType(type);
      }

      final suggestion = Suggestion(
        activity: result.activity,
      );
      yield SearchState.success(
        suggestion: suggestion,
        categories: state.categories,
      );
    } on Exception {
      yield const SearchState.failure();
    }
  }
}

/// maps [ActivityType] to [ActivityCategory]
ActivityType _fromCategoryToType(ActivityCategory category) {
  switch (category.name.toLowerCase()) {
    case 'education':
      return ActivityType.education;
    case 'recreational':
      return ActivityType.recreational;
    case 'social':
      return ActivityType.social;
    case 'diy':
      return ActivityType.diy;
    case 'charity':
      return ActivityType.charity;
    case 'cooking':
      return ActivityType.cooking;
    case 'relaxation':
      return ActivityType.relaxation;
    case 'music':
      return ActivityType.music;
    case 'busywork':
      return ActivityType.busywork;
    default:
      return null;
  }
}
