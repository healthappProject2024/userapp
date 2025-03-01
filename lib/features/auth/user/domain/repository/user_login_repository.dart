import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/auth/user/domain/entity/user_account.dart';
import 'package:userapp/utils/resources/error/failures.dart';

abstract interface class UserLoginRepository {
  Future<Either<Failures, UserAccount>> userLogin({required String email,required String password});
  Future<void> saveUser(String data);
}