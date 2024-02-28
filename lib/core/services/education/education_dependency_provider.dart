import 'package:education_list/core/services/dio/dio_services.dart';
import 'package:education_list/features/education/data/repositories/education_repository_impl.dart';
import 'package:education_list/features/education/data/sources/remote_education_source.dart';
import 'package:education_list/features/education/domain/repositories/education_repository.dart';
import 'package:education_list/features/education/domain/usecases/get_educations.dart';
import 'package:education_list/features/education/presentation/cubit/education_cubit.dart';
import 'package:get_it/get_it.dart';

class EducationDependencyProvider {
  static void register(GetIt serviceLocator) {
    serviceLocator.registerSingleton<RemoteEducationSource>(
      RemoteEducationSource(
        dioService: serviceLocator.get<DioService>()
      )
    );

    serviceLocator.registerSingleton<EducationRepository>(
      EducationRepositoryImpl(
        serviceLocator.get<RemoteEducationSource>()
      )
    );

    serviceLocator.registerSingleton<GetEducations>(
      GetEducations(
        serviceLocator.get<EducationRepository>()
      )
    );

    serviceLocator.registerFactory<EducationCubit>(() {
      return EducationCubit(
        serviceLocator.get<GetEducations>()
      );
    });
  }
}