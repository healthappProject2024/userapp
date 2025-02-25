import 'package:fpdart/fpdart.dart';
import 'package:userapp/features/therapist/home/data/data_source/local/get_therapist_name_local_data_source.dart';
import 'package:userapp/features/therapist/home/data/data_source/remote/find_users_remote_data_source.dart';
import 'package:userapp/features/therapist/home/domain/entity/users.dart';
import 'package:userapp/features/therapist/home/domain/repository/therapist_home_repository.dart';
import 'package:userapp/utils/resources/error/failures.dart';

class TherapistHomeRepositoryImpl implements TherapistHomeRepository {
  final GetTherapistNameLocalDataSource getTherapistNameLocalDataSource;
  final FindUsersRemoteDataSource findUsersRemoteDataSource;

  TherapistHomeRepositoryImpl({
    required this.findUsersRemoteDataSource,
    required this.getTherapistNameLocalDataSource,
  });

  @override
  Future<String> getTherapistName() async {
    try {
      final name = await getTherapistNameLocalDataSource.getTherapistName();
      return name; 
    } catch (e) {
      return "Error retrieving therapist name";
    }
  }

  @override
  Stream<Either<Failures, List<Users>>> loadUsers() {
    return findUsersRemoteDataSource.findUsers();
  }
}
