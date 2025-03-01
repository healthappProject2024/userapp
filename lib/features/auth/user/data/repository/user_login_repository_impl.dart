import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/auth/user/data/data_source/local/user_local_data_source.dart';
import 'package:userapp/features/auth/user/data/data_source/remote/user_login_remote_data_source.dart';
import 'package:userapp/features/auth/user/data/model/user_account_model.dart';
import 'package:userapp/features/auth/user/domain/repository/user_login_repository.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class UserLoginRepositoryImpl implements UserLoginRepository {
  final UserLocalDataSource userLocalDataSource;
  final UserLoginRemoteDataSource userLoginRemoteDataSource;

  UserLoginRepositoryImpl(
    this.userLocalDataSource,
    this.userLoginRemoteDataSource,
  );

  @override
  Future<void> saveUser(String data) async {
       try{
      await userLocalDataSource.cacheUser(data);
    }catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<Either<Failures, UserAccountModel>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      final user = await userLoginRemoteDataSource.userSignIn(
        email: email,
        password: password,
      );
      if (user != null) {
        return Right(user);
      } else {
        return Left(
          Failures(message: "Invalid credentials or therapist not found"),
        );
      }
    } catch (e) {
      return Left(Failures(message: e.toString()));
    }
  }
}
