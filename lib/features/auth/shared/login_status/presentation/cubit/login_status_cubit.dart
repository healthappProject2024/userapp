import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/features/auth/shared/login_status/domain/usecases/check_login_status.dart';
import 'package:userapp/features/auth/shared/login_status/domain/usecases/save_login_status.dart';

part 'login_status_state.dart';

class LoginStatusCubit extends Cubit<LoginStatusState> {
  final CheckLoginStatus checkLoginStatus;
  final SaveLoginStatus saveLoginStatus;

  LoginStatusCubit({
    required this.checkLoginStatus,
    required this.saveLoginStatus,
  }) : super(LoginStatusInitial()){
    loadLoginStatus();
  }



  Future<void> loadLoginStatus() async {
    try {
      final loginData = await checkLoginStatus();
      emit(LoginStatusLoaded(isLoggedIn: loginData.isLoggedin, role: loginData.role));
    } catch (e) {
      emit(LoginStatusError(message: "Failed to load login status"));
    }
  }

  Future<void> loginUser(String role) async {
    try {
      await saveLoginStatus(role: role);
      emit(LoginStatusLoaded(isLoggedIn: true, role: role));
    } catch (e) {
      emit(LoginStatusError(message: "Failed to save login status"));
    }
  }
}
