import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:userapp/utils/resources/error/failures.dart';

abstract interface class AddUserRepo {
  Future<Either<Failures, bool>> addUser({
    required String name,
    required String email,
    required String password,
    required File imageFile,
        required String therapisName,
  });
}