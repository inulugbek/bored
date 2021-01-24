part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState._({
    this.status = HomeStatus.initial,
    this.idea = const Idea(),
  });

  const HomeState.initial() : this._();

  const HomeState.loading() : this._(status: HomeStatus.loading);

  const HomeState.success(Idea idea)
      : this._(status: HomeStatus.success, idea: idea);

  const HomeState.failure() : this._(status: HomeStatus.failure);

  final HomeStatus status;
  final Idea idea;

  @override
  List<Object> get props => [status, idea];
}
