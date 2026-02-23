import 'package:bloc/bloc.dart';
import 'package:doctor/features/profile/data/repos/profile_repo.dart';
import 'package:doctor/features/profile/logic/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;

  ProfileCubit(this._profileRepo) : super(const ProfileState.initial());

  void getProfile() async {
    emit(const ProfileState.profileLoading());
    final response = await _profileRepo.getProfile();
    response.when(
      success: (profileResponseModel) {
        emit(ProfileState.profileSuccess(profileResponseModel));
      },
      failure: (errorHandler) {
        emit(ProfileState.profileError(errorHandler));
      },
    );
  }
}
