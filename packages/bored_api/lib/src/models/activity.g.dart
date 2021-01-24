// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map<String, dynamic> json) {
  return Activity(
    activity: json['activity'] as String,
    accessibility: (json['accessibility'] as num).toDouble(),
    type: _$enumDecode(_$ActivityTypeEnumMap, json['type']),
    participants: json['participants'] as int,
    price: (json['price'] as num).toDouble(),
    key: json['key'] as String,
  );
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'activity': instance.activity,
      'accessibility': instance.accessibility,
      'type': _$ActivityTypeEnumMap[instance.type],
      'participants': instance.participants,
      'price': instance.price,
      'key': instance.key,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$ActivityTypeEnumMap = {
  ActivityType.education: 'education',
  ActivityType.recreational: 'recreational',
  ActivityType.social: 'social',
  ActivityType.diy: 'diy',
  ActivityType.charity: 'charity',
  ActivityType.cooking: 'cooking',
  ActivityType.relaxation: 'relaxation',
  ActivityType.music: 'music',
  ActivityType.busywork: 'busywork',
};
