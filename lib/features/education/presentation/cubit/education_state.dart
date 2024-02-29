import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:equatable/equatable.dart';

enum GetEducationStatus {
  idle, loading, done, error
}

class EducationState extends Equatable {
  final GetEducationStatus? getEducationStatus;
  final List<EducationEntity>? educationEntities;
  final List<EducationEntity>? filteredEducationEntities;
  final List<String>? filters;
  final String? searchQuery;
  final bool? isFilterActive;

  const EducationState({
    this.getEducationStatus = GetEducationStatus.idle,
    this.educationEntities = const [],
    this.filteredEducationEntities = const [],
    this.filters = const [],
    this.searchQuery = "",
    this.isFilterActive = false
  });

  EducationState copyWith({
    GetEducationStatus? getEducationStatus,
    List<EducationEntity>? educationEntities,
    List<EducationEntity>? filteredEducationEntities,
    List<String>? filters,
    String? searchQuery,
    bool? isFilterActive
  }) {
    return EducationState(
      getEducationStatus: getEducationStatus ?? this.getEducationStatus,
      educationEntities: educationEntities ?? this.educationEntities,
      filteredEducationEntities: filteredEducationEntities ?? this.filteredEducationEntities,
      filters: filters ?? this.filters,
      searchQuery: searchQuery ?? this.searchQuery,
      isFilterActive: isFilterActive ?? this.isFilterActive
    );
  }
  
  @override
  List<Object?> get props => [
    getEducationStatus, educationEntities, filteredEducationEntities, searchQuery,
    filters, isFilterActive
  ];
}