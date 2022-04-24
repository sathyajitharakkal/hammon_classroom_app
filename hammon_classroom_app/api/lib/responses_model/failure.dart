part of api;

@immutable
class ResponseFailure implements Exception {
  const ResponseFailure._({
    this.errorCode,
    required this.errorMessage,
  });

  final int? errorCode;
  final String errorMessage;

  @override
  String toString() {
    return 'ResponseFailure{ $errorMessage}';
  }
}

@immutable
class AuthorizationFailure implements Exception {
  static const kUnauthenticated = AuthorizationFailure._(
      errorMessage: 'You are not logged in, please do refresh and log back in');

  const AuthorizationFailure._({
    this.errorCode,
    required this.errorMessage,
  });

  final int? errorCode;
  final String errorMessage;

  @override
  String toString() {
    return 'AuthorizationFailure: $errorMessage';
  }
}