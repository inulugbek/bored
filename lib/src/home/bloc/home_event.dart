part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class SearchRandom extends HomeEvent {
  const SearchRandom();

  @override
  List<Object> get props => [];
}
