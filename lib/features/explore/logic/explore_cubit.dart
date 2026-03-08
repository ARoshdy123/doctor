import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor/features/explore/data/repos/explore_repo.dart';
import 'package:doctor/features/explore/logic/explore_state.dart';
import 'package:doctor/features/home/data/models/specializations_response_model.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreRepo _exploreRepo;
  Timer? _debounce;
  List<SpecializationsData?> specializations = [];
  int? selectedSpecializationId;

  ExploreCubit(this._exploreRepo) : super(const ExploreState.initial());

  void getAllDoctors() async {
    selectedSpecializationId = null;
    emit(const ExploreState.loading());
    final response = await _exploreRepo.getAllDoctors();
    response.when(
      success: (allDoctorsResponseModel) {
        emit(ExploreState.success(allDoctorsResponseModel));
      },
      failure: (errorHandler) {
        emit(ExploreState.error(errorHandler));
      },
    );
  }

  void searchDoctors(String name) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (name.trim().isEmpty) {
        if (selectedSpecializationId != null) {
          filterDoctors(selectedSpecializationId!);
        } else {
          getAllDoctors();
        }
        return;
      }
      emit(const ExploreState.loading());
      final response = await _exploreRepo.searchDoctors(name);
      response.when(
        success: (allDoctorsResponseModel) {
          emit(ExploreState.success(allDoctorsResponseModel));
        },
        failure: (errorHandler) {
          emit(ExploreState.error(errorHandler));
        },
      );
    });
  }

  void filterDoctors(int specializationId) async {
    selectedSpecializationId = specializationId;
    emit(const ExploreState.loading());
    final response = await _exploreRepo.filterDoctors(specializationId);
    response.when(
      success: (allDoctorsResponseModel) {
        emit(ExploreState.success(allDoctorsResponseModel));
      },
      failure: (errorHandler) {
        emit(ExploreState.error(errorHandler));
      },
    );
  }

  Future<void> loadSpecializations() async {
    if (specializations.isNotEmpty) return;
    final response = await _exploreRepo.getSpecializations();
    response.when(
      success: (data) {
        specializations = data.specializationDataList ?? [];
      },
      failure: (_) {},
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
