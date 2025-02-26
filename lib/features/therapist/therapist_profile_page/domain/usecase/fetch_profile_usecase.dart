import 'package:userapp/features/therapist/therapist_profile_page/domain/entity/user.dart';
import 'package:userapp/features/therapist/therapist_profile_page/domain/repository/profile_repository.dart';

class FetchProfileUsecase {
  final ProfileRepository profileRepository;
  FetchProfileUsecase(this.profileRepository);
  Future<ProfileUser?> call()async {
    return await profileRepository.fetchProfileData();
  }
}