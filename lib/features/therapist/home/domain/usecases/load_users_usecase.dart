import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/home/domain/entity/users.dart';
import 'package:userapp/features/therapist/home/domain/repository/therapist_home_repository.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class GetTherapistNameUseCase {
  final TherapistHomeRepository repository;

  GetTherapistNameUseCase(this.repository);

  Future<String> call() async {
    return await repository.getTherapistName();
  }
}

class LoadUsersUseCase {
  final TherapistHomeRepository repository;

  LoadUsersUseCase(this.repository);

  Stream<Either<Failures, List<Users>>> call({required String therapistName}) {
    return repository.loadUsers(therapistName: therapistName);
  }
}
