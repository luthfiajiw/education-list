import 'package:dio/dio.dart';
import 'package:education_list/core/services/dio/dio_interceptor.dart';
import 'package:education_list/core/services/dio/dio_services.dart';
import 'package:education_list/core/services/education/education_dependency_provider.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> setupDependencies() async {
  serviceLocator.registerSingleton<DioService>(
    DioService(
      Dio(
        BaseOptions(baseUrl: 'https://mocki.io/v1')
      ),
      interceptor: DioInterceptor()
    )
  );

  EducationDependencyProvider.register(serviceLocator);
}