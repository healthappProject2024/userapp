import 'package:userapp/features/auth/shared/login_status/domain/repository/is_loggedin_repository.dart';

class LogOut {
  final IsLoggedinRepository repository;

  LogOut(this.repository);

  Future<void> call() async {
    return await repository.logOut();
  }
}
