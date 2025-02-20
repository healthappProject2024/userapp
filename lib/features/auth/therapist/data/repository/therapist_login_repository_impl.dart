import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/auth/therapist/data/model/therapist_model.dart';
import 'package:userapp/features/auth/therapist/data/remote_data_source/therapist_remote_data_source.dart';
import 'package:userapp/features/auth/therapist/domain/repository/therapist_login_repository.dart';
import '../../../../../utils/resources/error/failures.dart';

class TherapistLoginRepositoryImpl implements TherapistLoginRepository {
  final TherapistRemoteDataSource remoteDataSource;

  TherapistLoginRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failures, TherapistModel>> therapistLogin({
    required String email,
    required String password,
  }) async {
    try {
      final therapist = await remoteDataSource.therapistSignIn(
          email: email, password: password);
      if (therapist != null) {
        return Right(therapist);
      } else {
        return Left(
            Failures(message: "Invalid credentials or therapist not found"));
      }
    } catch (e) {
      return Left(Failures(message: e.toString()));
    }
  }
}
