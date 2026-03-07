import 'package:bloc/bloc.dart';
import 'package:doctor/features/profile/data/models/update_profile_request_body.dart';
import 'package:doctor/features/profile/data/repos/profile_repo.dart';
import 'package:doctor/features/profile/logic/cubit/update_profile_state.dart';
import 'package:flutter/widgets.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ProfileRepo _profileRepo;

  UpdateProfileCubit(this._profileRepo)
    : super(const UpdateProfileState.initial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int selectedGender = 0;

  void updateGender(int gender) {
    selectedGender = gender;
  }

  void initControllers({
    String? name,
    String? email,
    String? phone,
    String? gender,
  }) {
    nameController.text = name ?? '';
    emailController.text = email ?? '';
    phoneController.text = phone ?? '';
    selectedGender = gender == '1' ? 1 : 0;
  }

  void updateProfile() async {
    if (!formKey.currentState!.validate()) return;

    emit(const UpdateProfileState.loading());

    final response = await _profileRepo.updateProfile(
      UpdateProfileRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: selectedGender.toString(),
      ),
    );

    response.when(
      success: (profileResponse) {
        emit(UpdateProfileState.success(profileResponse));
      },
      failure: (errorHandler) {
        emit(
          UpdateProfileState.error(
            errorHandler.apiErrorModel.message ?? 'Update failed',
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
