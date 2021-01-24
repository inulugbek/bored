part of 'search_bloc.dart';

enum SearchStatus { initial, loading, noCategories, success, failure }

class SearchState extends Equatable {
  const SearchState._({
    this.status = SearchStatus.initial,
    this.categories = const <ActivityCategory>[],
    this.suggestion = const Suggestion(),
  });

  const SearchState.initial({
    List<ActivityCategory> categories,
  }) : this._(categories: categories);

  const SearchState.noCategories() : this._(status: SearchStatus.noCategories);

  const SearchState.loading() : this._(status: SearchStatus.loading);

  const SearchState.success({
    Suggestion suggestion,
    List<ActivityCategory> categories,
  }) : this._(
          status: SearchStatus.success,
          categories: categories,
          suggestion: suggestion,
        );

  const SearchState.failure() : this._(status: SearchStatus.failure);

  final SearchStatus status;
  final List<ActivityCategory> categories;
  final Suggestion suggestion;

  @override
  List<Object> get props => [status, categories, suggestion];
}
