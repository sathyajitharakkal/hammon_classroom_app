library api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:api/responses_model/classroom.dart';
import 'package:api/responses_model/students.dart';
import 'package:api/responses_model/subjects.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

part 'endpoints.dart';
part 'utils/debuggable_client.dart';
part 'responses_model/failure.dart';

class Api {
  static const String apiKey = "CD2A9";
  final Uri _baseUrl;
  final http.Client _client;

  @visibleForTesting
  Api(this._baseUrl, this._client);

  /// Creates instance of Api class when called
  /// ```dart
  /// Api _client = Api.create("https://base_url");
  /// ```
  factory Api.create(
      {required String baseUrl,
      Duration connectionTimeout = const Duration(seconds: 10)}) {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = connectionTimeout;
    return Api(Uri.parse(baseUrl), IOClient(httpClient));
  }

  factory Api.debuggable(
      {required String baseUrl,
      Duration connectionTimeout = const Duration(seconds: 10)}) {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = connectionTimeout;
    return Api(Uri.parse(baseUrl), _DebuggableClient(IOClient(httpClient)));
  }

  factory Api.proxy(
      {required String baseUrl,
      required String proxyIp,
      Duration connectionTimeout = const Duration(seconds: 5)}) {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = connectionTimeout;

    httpClient.findProxy = (uri) {
      return "PROXY $proxyIp:8888;";
    };

    httpClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => Platform.isAndroid);
    return Api(Uri.parse(baseUrl), IOClient(httpClient));
  }
}

extension on Api {
  Uri _endpoint(String path) =>
      _baseUrl.replace(path: '${_baseUrl.path}$path');

  Uri _endpointWithParam(String path, Map<String, dynamic> params) =>
      _baseUrl.replace(path: '${_baseUrl.path}$path', queryParameters: params);

  Future<T> _handleRequest<T>(
      {required Future<http.Response> Function() onRequest,
      required T Function(http.Response) onResponse}) async {
    try {
      final response = await onRequest();

      if (response.statusCode == 200) {
        return onResponse(response);
      } else {
        throw ResponseFailure._(
            errorCode: response.statusCode,
            errorMessage: 'Network Response Error');
      }
    } on SocketException {
      throw const ResponseFailure._(errorMessage: 'Socket Exception');
    } on TimeoutException {
      throw const ResponseFailure._(errorMessage: 'Request Time Out Exception');
    } on ResponseFailure catch (e) {
      if (e.errorMessage ==
          'You are not logged in, please do refresh and log back in') {
        throw const AuthorizationFailure._(
            errorMessage:
                'You are not logged in, please do refresh and log back in');
      }
      rethrow;
    } catch (e, s) {
      if (kDebugMode) {
        debugPrintStack(stackTrace: s);
      }
      throw ResponseFailure._(errorMessage: e.toString());
    }
  }
}

extension ClientApi on Api {
  ///Async function returns [Subjects] when called
  ///```dart
  ///Subjects listSubject = await getSubjects();
  ///```
  Future<Subjects> getSubjects() async {
    final url = _endpointWithParam(_subjects, {"api_key": Api.apiKey});

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    return _handleRequest(
        onRequest: () => _client.get(url, headers: headers),
        onResponse: (response) => subjectsFromJson(response.body));
  }

  Future<Students> getStudents() async {
    final url = _endpointWithParam(_students, {"api_key": Api.apiKey});

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    return _handleRequest(
        onRequest: () => _client.get(url, headers: headers),
        onResponse: (response) => studentsFromJson(response.body));
  }

  Future<Classrooms> getClassroom() async {
    final url = _endpointWithParam(_classroom, {"api_key": Api.apiKey});

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    return _handleRequest(
        onRequest: () => _client.get(url, headers: headers),
        onResponse: (response) => classroomsFromJson(response.body));
  }

  // Future<void> testServicePost({required Object body}) async {
  //   final url = _endpoint(_demoEndpoint);

  //   final Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //   };

  //   return _handleRequest(
  //       onRequest: () =>
  //           _client.post(url, body: jsonEncode(demoRequest), headers: headers),
  //       onResponse: (response) => demoRequestFromJson(response.body));
  // }
}
