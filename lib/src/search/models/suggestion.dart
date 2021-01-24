import 'package:equatable/equatable.dart';

import 'category.dart';

class Suggestion extends Equatable {
  final String activity;
  final ActivityCategory category;

  const Suggestion({
    this.activity,
    this.category,
  });

  @override
  List<Object> get props => [
        activity,
        category,
      ];
}
