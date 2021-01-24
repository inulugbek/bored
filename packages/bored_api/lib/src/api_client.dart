import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/activity.dart';

/// Thrown if an exception occurs while making an `http` request.
class HttpException implements Exception {}

/// {@template http_request_failure}
/// Thrown if an `http` request returns a non-200 status code.
/// {@endtemplate}
class HttpRequestFailure implements Exception {
  /// {@macro http_request_failure}
  const HttpRequestFailure(this.statusCode);

  /// The status code of the response.
  final int statusCode;
}

/// Thrown if an excepton occurs while decoding the response body.
class JsonDecodeException implements Exception {}

/// Thrown is an error occurs while deserializing the response body.
class JsonDeserializationException implements Exception {}

class BoredApiCLient {
  /// {@macro datamuse_api_client}
  BoredApiCLient({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _authority = 'www.boredapi.com';

  final http.Client _httpClient;

  /// Find a random activity with a given parameters
  Future<Activity> getActivity({
    int key,
    ActivityType type,
    int participants,
    double price,
    double minPrice,
    double maxPrice,
    double accessibility,
    double minAccessibility,
    double maxAccessibility,
  }) async {
    final queryParams = <String, String>{};

    if (key != null) {
      queryParams.addAll({'key': '$key'});
    }
    if (type != null) {
      queryParams.addAll({
        'type': type.toString().replaceAll('ActivityType.', ''),
      });
    }
    if (participants != null) {
      queryParams.addAll({'participants': '$participants'});
    }
    if (price != null) {
      queryParams.addAll({'price': '$price'});
    }
    if (minPrice != null && maxPrice != null) {
      queryParams.addAll({
        'minprice': '$minPrice',
        'maxprice': '$maxPrice',
      });
    }
    if (accessibility != null) {
      queryParams.addAll({'accessibility': '$accessibility'});
    }
    if (minAccessibility != null && maxAccessibility != null) {
      queryParams.addAll({
        'minaccessibility': '$minAccessibility',
        'maxaccessibility': '$maxAccessibility',
      });
    }

    try {
      if (queryParams.isEmpty) {
        return _boredRequest();
      } else {
        return _boredRequest(queryParams: queryParams);
      }
    } on Exception {
      rethrow;
    }
  }

  /// makes request to Wikipedia API with provided query params and returns [http.Response]
  Future<Activity> _boredRequest({Map<String, String> queryParams}) async {
    Uri uri;

    if (queryParams != null) {
      uri = Uri.http(_authority, '/api/activity', queryParams);
    } else {
      uri = Uri.http(_authority, '/api/activity');
    }

    http.Response response;

    try {
      response = await _httpClient.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );

      if (response.statusCode != 200) {
        throw HttpRequestFailure(response.statusCode);
      }
    } on Exception {
      throw HttpException();
    }

    Map<String, dynamic> body;

    try {
      body = json.decode(response.body) as Map<String, dynamic>;
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      final result = Activity.fromJson(body);

      return result;
    } on Exception {
      throw JsonDeserializationException();
    }
  }
}
