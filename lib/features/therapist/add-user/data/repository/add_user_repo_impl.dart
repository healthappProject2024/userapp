import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/add-user/data/remote_data_source/add_user_remote_data_source.dart';
import 'package:userapp/features/therapist/add-user/domain/repository/add_user_repo.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class AddUserRepoImpl implements AddUserRepo{
  final AddUserRemoteDataSource addUserRemoteDataSource;

  AddUserRepoImpl({required this.addUserRemoteDataSource});
  @override
  Future<Either<Failures, bool>> addUser({required String name, required String email, required String password, required File imageFile,    required String therapisName,}) async {
    try{
      final response = await addUserRemoteDataSource.adduser(name: name, email: email, password: password, imageFile: imageFile,therapisName: therapisName);
      return Right(response);
    }catch(e){
      return Left(Failures(message: e.toString()));
    }
  }
}
