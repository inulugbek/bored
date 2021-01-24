part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class GetCategories extends SearchEvent {
  const GetCategories();

  @override
  List<Object> get props => [];
}

class SearchCategory extends SearchEvent {
  final ActivityCategory category;

  const SearchCategory(this.category);

  @override
  List<Object> get props => [category];
}
