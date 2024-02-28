import 'package:education_list/core/resources/data_state.dart';
import 'package:education_list/features/education/domain/usecases/get_educations.dart';
import 'package:education_list/features/education/presentation/cubit/education_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EducationCubit extends Cubit<EducationState> {
  final GetEducations _getEducations;

  EducationCubit(this._getEducations) : super(const EducationState());
  
  Future<void> onGetEducations() async {
    try {
      emit(state.copyWith(getEducationStatus: GetEducationStatus.loading));

      final result = await _getEducations();

      if (result is DataSuccess && result.data != null) {
        emit(state.copyWith(
          getEducationStatus: GetEducationStatus.done,
          educationEntities: result.data
        ));
      } else {
        emit(state.copyWith(
          getEducationStatus: GetEducationStatus.error
        ));
      }
    } catch (e) {
      rethrow;
    }
  }
}