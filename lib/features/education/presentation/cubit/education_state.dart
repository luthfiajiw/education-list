import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:equatable/equatable.dart';

enum GetEducationStatus {
  idle, loading, done, error
}

class EducationState extends Equatable {
  final GetEducationStatus? getEducationStatus;
  final List<EducationEntity>? educationEntities;

  const EducationState({
    this.getEducationStatus = GetEducationStatus.idle,
    this.educationEntities = const []
  });

  EducationState copyWith({
    GetEducationStatus? getEducationStatus,
    List<EducationEntity>? educationEntities
  }) {
    return EducationState(
      getEducationStatus: getEducationStatus ?? this.getEducationStatus,
      educationEntities: educationEntities ?? this.educationEntities
    );
  }
  
  @override
  List<Object?> get props => [
    getEducationStatus, educationEntities
  ];
}