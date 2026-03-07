import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/features/explore/data/models/all_doctors_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'explore_state.freezed.dart';

@freezed
class ExploreState with _$ExploreState {
  const factory ExploreState.initial() = _Initial;

  const factory ExploreState.loading() = ExploreLoading;

  const factory ExploreState.success(
    AllDoctorsResponseModel allDoctorsResponseModel,
  ) = ExploreSuccess;

  const factory ExploreState.error(ErrorHandler errorHandler) = ExploreError;
}
