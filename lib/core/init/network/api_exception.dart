abstract class ApiException implements Exception {
  final String? _message;
  final String? errorCode;

  ApiException([
    this._message,
    this.errorCode,
  ]);

  @override
  String toString() {
    return "$_message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message]) : super(message);
}

class BadRequestException extends ApiException {
  BadRequestException([message, errorCode]) : super(message, errorCode);
}
