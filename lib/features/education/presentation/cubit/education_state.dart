import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:equatable/equatable.dart';

enum GetEducationStatus {
  idle, loading, done, error
}

class EducationState extends Equatable {
  final GetEducationStatus? getEducationStatus;
  final List<EducationEntity>? educationEntities;
  final List<EducationEntity>? filteredEducationEntities;
  final String? searchQuery;

  const EducationState({
    this.getEducationStatus = GetEducationStatus.idle,
    this.educationEntities = const [],
    this.filteredEducationEntities = const [],
    this.searchQuery = ""
  });

  EducationState copyWith({
    GetEducationStatus? getEducationStatus,
    List<EducationEntity>? educationEntities,
    List<EducationEntity>? filteredEducationEntities,
    String? searchQuery
  }) {
    return EducationState(
      getEducationStatus: getEducationStatus ?? this.getEducationStatus,
      educationEntities: educationEntities ?? this.educationEntities,
      filteredEducationEntities: filteredEducationEntities ?? this.filteredEducationEntities,
      searchQuery: searchQuery ?? this.searchQuery
    );
  }
  
  @override
  List<Object?> get props => [
    getEducationStatus, educationEntities, filteredEducationEntities, searchQuery
  ];
}