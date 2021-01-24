import 'package:equatable/equatable.dart';

class ActivityCategory extends Equatable {
  final String name;
  final String emoji;

  const ActivityCategory({
    this.name,
    this.emoji,
  });

  @override
  List<Object> get props => [name, emoji];
}
