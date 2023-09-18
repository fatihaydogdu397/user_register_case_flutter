import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:user_register_case_flutter/config/config.dart';
import 'package:user_register_case_flutter/core/init/network/api_exception.dart';

class APICaller {
  static APICaller? _instance;
  static APICaller? get instance {
    _instance ??= APICaller._init();

    return _instance;
  }

  late final Dio _dio;

  APICaller._init() {
    final baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 12),
    );

    _dio = Dio(baseOptions);

    initializeBaseUrl();

    addInterceptors();
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    void Function()? onRetry,
  }) async {
    dynamic responseJson;
    Response response;
    try {
      initializeBaseUrl();
      response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      responseJson = _handleResponse(response, onRetry: onRetry);
    } on DioException catch (_) {
      _handleResponse(_.response, onRetry: onRetry);
    }

    return responseJson;
  }

  Future delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    void Function()? onRetry,
  }) async {
    dynamic responseJson;
    Response response;
    try {
      initializeBaseUrl();
      response = await _dio.delete(
        path,
        queryParameters: queryParameters,
      );
      responseJson = _handleResponse(response, onRetry: onRetry);
    } on DioException catch (_) {
      _handleResponse(_.response, onRetry: onRetry);
    }

    return responseJson;
  }

  Future post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? contentType = "application/json",
    void Function()? onRetry,
  }) async {
    dynamic responseJson;
    Response response;

    try {
      initializeBaseUrl();
      if (data == null) {
        response = await _dio.post(
          url,
          queryParameters: queryParameters,
        );
      } else {
        response = await _dio.post(
          url,
          data: data,
          options: Options(contentType: contentType),
          queryParameters: queryParameters,
        );
      }
      responseJson = _handleResponse(response, onRetry: onRetry);
    } on DioException catch (_) {
      _handleResponse(_.response, onRetry: onRetry);
    }
    return responseJson;
  }

  Future put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    String? contentType = "application/json",
    void Function()? onRetry,
  }) async {
    dynamic responseJson;
    Response response;

    try {
      initializeBaseUrl();
      response = await _dio.put(
        url,
        data: data,
        options: Options(contentType: contentType),
        queryParameters: queryParameters,
      );
      responseJson = _handleResponse(response, onRetry: onRetry);
    } on DioException catch (_) {
      _handleResponse(_.response, onRetry: onRetry);
    }
    return responseJson;
  }

  dynamic _handleResponse(Response? response, {void Function()? onRetry}) {
    if (response == null) {
      throw FetchDataException('Unable to reach server. (response is null)');
    }
    final dynamic responseJson;
    responseJson = response.data;
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
      case HttpStatus.noContent:
        return responseJson;
      case HttpStatus.forbidden:
      case HttpStatus.unprocessableEntity:
      case HttpStatus.badRequest:
      case HttpStatus.serviceUnavailable:
      case HttpStatus.internalServerError:
        throw BadRequestException(responseJson['message'] ?? responseJson['detail'], responseJson["errorCode"]);
      default:
        throw FetchDataException(responseJson['message'] ?? 'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  void addInterceptors() {
    final LogInterceptor logInterceptor = LogInterceptor(requestBody: true, error: true, responseBody: true);

    _dio.interceptors.clear();

    if (kDebugMode) _dio.interceptors.add(logInterceptor);
  }

  void initializeBaseUrl() {
    _dio.options.baseUrl = AppConfig.shared.baseUrl;
  }
}
