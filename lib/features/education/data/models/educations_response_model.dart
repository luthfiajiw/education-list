import 'package:education_list/features/education/data/models/education_model.dart';
import 'package:education_list/features/education/domain/entities/eduation_entity.dart';
import 'package:education_list/features/education/domain/entities/educations_response_entity.dart';

class EducationsResponseModel extends EducationsResponseEntity {
  const EducationsResponseModel({
    List<EducationEntity>? data
  }) : super(
    data: data
  );

  factory EducationsResponseModel.fromJson(Map<String, dynamic> json) {
    return EducationsResponseModel(
      data: (json["data"] as List<dynamic>?)
        ?.map((e) {
          return EducationModel.fromJson(e);
        }).toList()
    );
  }
}