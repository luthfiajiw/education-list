import 'package:dio/dio.dart';
import 'package:education_list/core/services/dio/dio_interceptor.dart';

class DioService {
  final Dio _dio;
  final DioInterceptor? interceptor;

  DioService(this._dio, {this.interceptor}) {
    if (interceptor != null) {
      _dio.interceptors.add(interceptor!);
    }
  }

  Dio get dio => _dio;
}