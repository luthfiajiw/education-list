import 'package:education_list/core/resources/data_state.dart';
import 'package:education_list/features/education/domain/entities/eduation_entity.dart';

abstract class EducationRepository {
  Future<DataState<List<EducationEntity>>> getEducations();
}