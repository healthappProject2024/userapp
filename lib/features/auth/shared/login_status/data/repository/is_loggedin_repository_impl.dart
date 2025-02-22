import 'package:userapp/features/auth/shared/login_status/data/local_data_source/login_status_local_data_source.dart';
import 'package:userapp/features/auth/shared/login_status/domain/entity/is_loggedin.dart';
import 'package:userapp/features/auth/shared/login_status/domain/repository/is_loggedin_repository.dart';

class IsLoggedinRepositoryImpl implements IsLoggedinRepository {
  final LoginStatusLocalDataSource loginStatusLocalDataSource;

  IsLoggedinRepositoryImpl(this.loginStatusLocalDataSource);

  @override
  Future<IsLoggedin> checkLoginStatus() async {
    try {
      final loginStatus = await loginStatusLocalDataSource.getLoginStatus();
      return IsLoggedin(isLoggedin: loginStatus.isLoggedin, role: loginStatus.role);
    } catch (e) {
      throw Exception("Error checking login status: ${e.toString()}");
    }
  }

  @override
  Future<void> saveLoginStatus({required String role}) async {
    try {
      await loginStatusLocalDataSource.saveLoginStatus(role: role);
    } catch (e) {
      throw Exception("Error saving login status: ${e.toString()}");
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await loginStatusLocalDataSource.logOut();
    } catch (e) {
      throw Exception("Error logging out: ${e.toString()}");
    }
  }
}
