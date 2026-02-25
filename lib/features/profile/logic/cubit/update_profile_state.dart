import 'package:doctor/features/profile/data/models/profile_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_state.freezed.dart';

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState.initial() = _Initial;
  const factory UpdateProfileState.loading() = UpdateProfileLoading;
  const factory UpdateProfileState.success(
    ProfileResponseModel profileResponseModel,
  ) = UpdateProfileSuccess;
  const factory UpdateProfileState.error(String message) = UpdateProfileError;
}
