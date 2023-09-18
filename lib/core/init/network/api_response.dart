class ApiResponse<T> {
  late ApiResponseStatus status;
  T? data;
  String? message;
  String? errorCode;
  dynamic exception;
  ApiResponse.idle() : status = ApiResponseStatus.idle;
  ApiResponse.loading() : status = ApiResponseStatus.loading;
  ApiResponse.success(this.data) {
    status = ApiResponseStatus.success;
    if (data is Map) {
      message = (data as Map)["message"];
    }
  }
  ApiResponse.error(String string) {
    status = ApiResponseStatus.error;
  }

  bool get isIdle => status == ApiResponseStatus.idle;
  bool get isLoading => status == ApiResponseStatus.loading;
  bool get isError => (status == ApiResponseStatus.error || status == ApiResponseStatus.unAuthorized);
  bool get isUnauthorized => status == ApiResponseStatus.unAuthorized;
  bool get isSuccess => status == ApiResponseStatus.success;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum ApiResponseStatus { idle, loading, success, error, unAuthorized }
