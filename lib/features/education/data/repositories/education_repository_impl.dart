import 'package:dio/dio.dart';
import 'package:education_list/core/resources/data_state.dart';
import 'package:education_list/features/education/data/sources/remote_education_source.dart';
import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:education_list/features/education/domain/repositories/education_repository.dart';

class EducationRepositoryImpl implements EducationRepository {
  final RemoteEducationSource _source;

  EducationRepositoryImpl(this._source);

  @override
  Future<DataState<List<EducationEntity>>> getEducations() async {
    try {
      final response = await _source.getEducations();

      return DataSuccess(response.data!.data);
    } on DioException catch (e) { 
      return DataFailed(e);
    }
  }
  
}