import 'package:education_list/core/resources/data_state.dart';
import 'package:education_list/core/resources/usecase.dart';
import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:education_list/features/education/domain/repositories/education_repository.dart';

class GetEducations implements UseCase<DataState<List<EducationEntity>>, void> {
  final EducationRepository _repository;

  GetEducations(this._repository);

  @override
  Future<DataState<List<EducationEntity>>> call({void params}) {
    return _repository.getEducations();
  }
  
}