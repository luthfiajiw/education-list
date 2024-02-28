import 'package:dio/dio.dart';
import 'package:education_list/core/resources/response_mixin.dart';
import 'package:education_list/core/services/dio/dio_services.dart';
import 'package:education_list/features/education/data/models/educations_response_model.dart';

class RemoteEducationSource with ResponseMixin {
  final DioService _dioService;

  RemoteEducationSource({required DioService dioService}) : _dioService = dioService;

  Future<Response<EducationsResponseModel>> getEducations() async {
    try {
      const path = "/f46bf9ad-a693-4acf-93bc-00e7f9bda18d";

      final result = await _dioService.dio.get(path);

      return response(result, EducationsResponseModel.fromJson(result.data));
    } catch (e) {
      rethrow;
    }
  }
}