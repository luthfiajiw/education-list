import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:equatable/equatable.dart';

class EducationsResponseEntity extends Equatable {
  final List<EducationEntity>? data;

  const EducationsResponseEntity({
    this.data = const []
  });
  
  @override
  List<Object?> get props => [data];
}