import 'package:dio/dio.dart';

mixin ResponseMixin {
  Response<T> response<T>(Response response, T data) {
    return Response<T>(
      requestOptions: response.requestOptions,
      data: data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers
    );
  }
}