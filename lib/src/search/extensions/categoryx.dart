import 'package:bored_repository/bored_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:stringx/stringx.dart';

import '../search.dart';

extension ActivityCategoryMapper on ActivityType {
  ActivityCategory toActivityCategory() {
    switch (this) {
      case ActivityType.busywork:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '👷‍♂️');
      case ActivityType.education:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '📚');
      case ActivityType.recreational:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '🐫');
      case ActivityType.social:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '👫');
      case ActivityType.diy:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '🔨');
      case ActivityType.charity:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '💰');
      case ActivityType.cooking:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '👩‍🍳');
      case ActivityType.relaxation:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '🛀');
      case ActivityType.music:
        return ActivityCategory(
            name: describeEnum(this).capitalize(), emoji: '🎧');
      default:
        return const ActivityCategory(name: 'Random', emoji: '🤙');
    }
  }
}
