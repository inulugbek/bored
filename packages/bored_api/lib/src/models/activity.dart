import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable(nullable: false)
class Activity {
  /// Description of the queried activity
  final String activity;

  /// A factor describing how possible an event is to do with zero being the most accessible
  /// [0.0, 1.0]
  final double accessibility;

  /// Type of the activity
  /// ["education", "recreational", "social", "diy", "charity", "cooking", "relaxation", "music", "busywork"]
  final ActivityType type;

  /// The number of people that this activity could involve
  /// [0, n]
  final int participants;

  /// A factor describing the cost of the event with zero being free
  /// [0, 1]
  final double price;

  /// A unique numeric id
  /// [1000000, 9999999]
  final String key;

  Activity({
    this.activity,
    this.accessibility,
    this.type,
    this.participants,
    this.price,
    this.key,
  });

  /// Converts a [Map<String, dynamic>] into a [Activity] instance.
  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);

  /// Converts a [Activity] instance into a [Map<String, dynamic>].
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}

enum ActivityType {
  @JsonValue('education')
  education,

  @JsonValue('recreational')
  recreational,

  @JsonValue('social')
  social,

  @JsonValue('diy')
  diy,

  @JsonValue('charity')
  charity,

  @JsonValue('cooking')
  cooking,

  @JsonValue('relaxation')
  relaxation,

  @JsonValue('music')
  music,

  @JsonValue('busywork')
  busywork,
}
