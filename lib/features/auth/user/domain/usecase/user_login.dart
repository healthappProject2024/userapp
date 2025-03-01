import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/auth/user/domain/entity/user_account.dart';
import 'package:userapp/features/auth/user/domain/repository/user_login_repository.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class UserLoginUsecase {
  final UserLoginRepository userLoginRepository;

  UserLoginUsecase(this.userLoginRepository);

  Future<Either<Failures, UserAccount>> call({
    required String email,
    required String password,

  }) async {
    return await userLoginRepository.userLogin(
      email: email,
      password: password,
    );
  }
}
