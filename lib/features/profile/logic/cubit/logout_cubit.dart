import 'package:bloc/bloc.dart';
import 'package:doctor/core/helpers/constants.dart';
import 'package:doctor/core/helpers/shared_pref_helper.dart';
import 'package:doctor/features/profile/data/repos/profile_repo.dart';
import 'package:doctor/features/profile/logic/cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final ProfileRepo _profileRepo;

  LogoutCubit(this._profileRepo) : super(LogoutInitial());

  void logout() async {
    emit(LogoutLoading());
    final response = await _profileRepo.logout();
    response.when(
      success: (_) async {
        await SharedPrefHelper.removeSecuredData(SharedPrefKeys.userToken);
        emit(LogoutSuccess());
      },
      failure: (errorHandler) {
        emit(
          LogoutError(errorHandler.apiErrorModel.message ?? 'Logout failed'),
        );
      },
    );
  }
}
