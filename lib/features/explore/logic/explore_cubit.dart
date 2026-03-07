import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:doctor/features/explore/data/repos/explore_repo.dart';
import 'package:doctor/features/explore/logic/explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ExploreRepo _exploreRepo;
  Timer? _debounce;

  ExploreCubit(this._exploreRepo) : super(const ExploreState.initial());

  void getAllDoctors() async {
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
        getAllDoctors();
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

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
