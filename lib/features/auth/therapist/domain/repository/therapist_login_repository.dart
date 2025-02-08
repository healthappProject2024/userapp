import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/auth/therapist/domain/entity/therapist.dart';
import 'package:userapp/utils/resources/error/failures.dart';

abstract interface class TherapistLoginRepository {
  Future<Either<Failures, Therapist>> therapistLogin({required String email,required String password});
}