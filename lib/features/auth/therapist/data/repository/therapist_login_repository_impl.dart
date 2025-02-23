import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/auth/therapist/data/data_sources/local/therapist_local_data_source.dart';
import 'package:userapp/features/auth/therapist/data/model/therapist_model.dart';
import 'package:userapp/features/auth/therapist/data/data_sources/remote/therapist_remote_data_source.dart';
import 'package:userapp/features/auth/therapist/domain/repository/therapist_login_repository.dart';
import '../../../../../utils/resources/error/failures.dart';

class TherapistLoginRepositoryImpl implements TherapistLoginRepository {
  final TherapistRemoteDataSource remoteDataSource;
  final TherapistLocalDataSource therapistLocalDataSource;

  TherapistLoginRepositoryImpl({
    required this.remoteDataSource,
    required this.therapistLocalDataSource,
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
  
  @override
  Future<void> saveTherapist(String data) {
    // TODO: implement saveTherapist
    throw UnimplementedError();
  }
  
  
// @override
// Future<void> saveTherapist(TherapistModel therapistModel) async {
//   try {
//     await therapistLocalDataSource.cacheTherapist(therapistModel);
//   } catch (e) {
//     debugPrint('Error saving therapist data: $e');
//     throw Exception('Failed to save therapist data: ${e.toString()}');
//   }
// }
}
