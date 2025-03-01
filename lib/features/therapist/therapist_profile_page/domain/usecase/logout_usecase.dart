import 'package:userapp/features/therapist/therapist_profile_page/domain/repository/profile_repository.dart';

class LogoutUsecase {
  final ProfileRepository profileRepository;
  LogoutUsecase(this.profileRepository);

  Future<void>call() async {
    await profileRepository.clearLocalStorage();
    // await profileRepository.logOut();
  }
}
