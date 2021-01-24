import 'package:equatable/equatable.dart';

class Idea extends Equatable {
  final String activity;

  const Idea({this.activity});

  @override
  List<Object> get props => [activity];
}
