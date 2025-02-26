import 'package:userapp/features/therapist/therapist_profile_page/domain/entity/user.dart';

abstract interface class ProfileRepository {
  Future<ProfileUser?> fetchProfileData();
  Future<void> logOut();
  Future<void> clearLocalStorage();
}