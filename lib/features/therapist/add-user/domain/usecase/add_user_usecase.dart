import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/add-user/domain/repository/add_user_repo.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class AddUserUseCase {
  final AddUserRepo repository;

  AddUserUseCase({required this.repository});

  Future<Either<Failures, bool>> call({
    required String name,
    required String email,
    required String password,
    required File imageFile,
    required String therapisName,
  }) {
    return repository.addUser(
      name: name,
      email: email,
      password: password,
      imageFile: imageFile,
      therapisName: therapisName,
    );
  }
}
