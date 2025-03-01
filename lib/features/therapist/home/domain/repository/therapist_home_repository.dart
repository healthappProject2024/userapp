import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/home/domain/entity/users.dart';
import 'package:userapp/utils/resources/error/failures.dart';

abstract interface class TherapistHomeRepository {
  Future<String> getTherapistName();
  Stream<Either<Failures, List<Users>>> loadUsers({required String therapistName});
}