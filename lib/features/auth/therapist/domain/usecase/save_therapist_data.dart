import 'package:userapp/features/auth/therapist/domain/repository/therapist_login_repository.dart';

class SaveTherapistDataUsecase {
  final TherapistLoginRepository repository;
  SaveTherapistDataUsecase({required this.repository});

  Future<void> call({required String data}) async {
    await repository.saveTherapist(data);
  }
}
