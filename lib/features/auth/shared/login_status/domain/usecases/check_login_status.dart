import 'package:userapp/features/auth/shared/login_status/domain/entity/is_loggedin.dart';
import 'package:userapp/features/auth/shared/login_status/domain/repository/is_loggedin_repository.dart';

class CheckLoginStatus {
  final IsLoggedinRepository repository;

  CheckLoginStatus(this.repository);

  Future<IsLoggedin> call() async {
    return await repository.checkLoginStatus();
  }
}
