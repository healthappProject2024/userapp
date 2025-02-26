import 'package:userapp/features/auth/shared/login_status/domain/entity/is_loggedin.dart';

abstract interface class IsLoggedinRepository {
  Future<IsLoggedin> checkLoginStatus();
  Future<void> saveLoginStatus({required String role});
}