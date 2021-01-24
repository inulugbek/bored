import 'package:bored_api/bored_api.dart';
import 'package:meta/meta.dart';

export 'package:bored_api/bored_api.dart';

/// Thrown when an error occurs while performing a search.
class SearchException implements Exception {}

class BoredRepository {
  BoredRepository({BoredApiCLient boredApiClient})
      : _boredApiClient = boredApiClient ?? BoredApiCLient();

  final BoredApiCLient _boredApiClient;

  /// Retrurns all possible [Activity] types
  Future<List<ActivityType>> getActivityTypes() async => ActivityType.values;

  /// Returns a random [Activity]
  ///
  /// Throws a [SearchException] if an error occurs.
  Future<Activity> getRandom() async {
    try {
      final activity = await _boredApiClient.getActivity();
      return activity;
    } on Exception {
      throw SearchException();
    }
  }

  /// Returns an [Activity] by its key
  /// A [key] should be provided
  ///
  /// Throws a [SearchException] if an error occurs.
  Future<Activity> getByKey(int key) async {
    try {
      final activity = await _boredApiClient.getActivity(key: key);
      return activity;
    } on Exception {
      throw SearchException();
    }
  }

  /// Returns a random [Activity] with a given type
  /// A [type] should be provided
  ///
  /// Throws a [SearchException] if an error occurs.
  Future<Activity> getByType(ActivityType type) async {
    try {
      final activity = await _boredApiClient.getActivity(type: type);
      return activity;
    } on Exception {
      throw SearchException();
    }
  }

  /// Returns a random [Activity] with a given number of participants
  /// A [participants] should be provided
  ///
  /// Throws a [SearchException] if an error occurs.
  Future<Activity> getForParticipants(int participants) async {
    try {
      final activity =
          await _boredApiClient.getActivity(participants: participants);
      return activity;
    } on Exception {
      throw SearchException();
    }
  }

  /// Returns a random [Activity] with a specified price
  /// A [price] should be provided
  ///
  /// Throws a [SearchException] if an error occurs.
  Future<Activity> getForPriceRange(double price) async {
    try {
      final activity = await _boredApiClient.getActivity(price: price);
      return activity;
    } on Exception {
      throw SearchException();
    }
  }

  /// Returns a random [Activity] with a specified price in an inclusively constrained range
  /// A [minPrice] and a [maxPrice] should be provided
  ///
  /// Throws a [SearchException] if an error occurs.
  Future<Activity> getForSpecificPriceRange({
    @required double minPrice,
    @required double maxPrice,
  }) async {
    try {
      final activity = await _boredApiClient.getActivity(
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      return activity;
    } on Exception {
      throw SearchException();
    }
  }

  /// Returns a random [Activity] with a specified accessibility
  /// A [accessibility] should be provided
  ///
  /// Throws a [SearchException] if an error occurs.
  Future<Activity> getForAccessibility(double accessibility) async {
    try {
      final activity = await _boredApiClient.getActivity(
        accessibility: accessibility,
      );
      return activity;
    } on Exception {
      throw SearchException();
    }
  }

  /// Returns a random [Activity] with a specified accessibility in an inclusively constrained range
  /// A [minAccessibility] and a [maxAccessibility] should be provided
  ///
  /// Throws a [SearchException] if an error occurs.
  Future<Activity> getForSpecificAccessibility({
    @required double minAccessibility,
    @required double maxAccessibility,
  }) async {
    try {
      final activity = await _boredApiClient.getActivity(
        minAccessibility: minAccessibility,
        maxAccessibility: maxAccessibility,
      );
      return activity;
    } on Exception {
      throw SearchException();
    }
  }
}
