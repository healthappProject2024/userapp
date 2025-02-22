import 'package:userapp/features/auth/shared/login_status/domain/repository/is_loggedin_repository.dart';

class SaveLoginStatus {
  final IsLoggedinRepository repository;

  SaveLoginStatus(this.repository);

  Future<void> call({required String role}) async {
    return await repository.saveLoginStatus(role: role);
  }
}
