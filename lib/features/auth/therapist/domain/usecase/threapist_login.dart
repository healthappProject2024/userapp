import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/auth/therapist/domain/entity/therapist.dart';
import 'package:userapp/features/auth/therapist/domain/repository/therapist_login_repository.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class TherapistLoginUseCase {
  final TherapistLoginRepository repository;

  TherapistLoginUseCase({required this.repository});

  Future<Either<Failures, Therapist>> call({required String email, required String password}) {
    return repository.therapistLogin(email: email, password: password);
  }
}
