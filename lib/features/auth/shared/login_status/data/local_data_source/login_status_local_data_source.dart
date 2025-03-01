import 'package:userapp/features/auth/shared/login_status/data/model/is_loggedin_model.dart';
import 'package:userapp/utils/const/local_data_helper.dart/sharedpreference_helper.dart';
import 'package:userapp/utils/service/local_data_service.dart';

abstract interface class LoginStatusLocalDataSource {
  Future<IsLoggedinModel> getLoginStatus();
  Future<void> saveLoginStatus({required String role});
}

class LoginStatusLocalDataSourceImpl implements LoginStatusLocalDataSource {
  final LocalDataService localDataService;
  LoginStatusLocalDataSourceImpl(this.localDataService);

  @override
  Future<IsLoggedinModel> getLoginStatus() async {
    try {
      bool isLoggedIn = localDataService.getBoolValue(
        SharedpreferenceHelper.loginStatus,
      );
      String role = localDataService.getString(SharedpreferenceHelper.role);
      return IsLoggedinModel(isLoggedin: isLoggedIn, role: role);
    } catch (e) {
      throw Exception("Error fetching login status: ${e.toString()}");
    }
  }

  @override
  Future<void> saveLoginStatus({required String role}) async {
    try {
      await localDataService.setBoolValue(SharedpreferenceHelper.loginStatus);
      await localDataService.setString(
        key: SharedpreferenceHelper.role,
        value: role,
      );
    } catch (e) {
      print("Error is : ${e.toString()}");
      throw Exception(e.toString());
    }
  }
}
