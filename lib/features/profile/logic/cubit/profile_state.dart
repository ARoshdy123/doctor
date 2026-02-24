import 'package:doctor/core/networking/api_error_handler.dart';
import 'package:doctor/features/profile/data/models/profile_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.profileLoading() = ProfileLoading;

  const factory ProfileState.profileSuccess(
    ProfileResponseModel profileResponseModel,
  ) = ProfileSuccess;

  const factory ProfileState.profileError(ErrorHandler errorHandler) =
      ProfileError;
}
