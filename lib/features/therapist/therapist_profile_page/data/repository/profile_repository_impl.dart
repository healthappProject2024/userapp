import 'package:userapp/features/therapist/therapist_profile_page/data/data_source/local/profile_local_data_source.dart';
import 'package:userapp/features/therapist/therapist_profile_page/data/data_source/remote/profile_remote_data_source.dart';
import 'package:userapp/features/therapist/therapist_profile_page/data/model/user_model.dart';
import 'package:userapp/features/therapist/therapist_profile_page/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource profileLocalDataSource;
  final ProfileRemoteDataSource profileRemoteDataSource;

  ProfileRepositoryImpl(this.profileLocalDataSource,this.profileRemoteDataSource);

  @override
  Future<ProfileUserModel?> fetchProfileData() async {
    try {
      return profileLocalDataSource.fetchUser();
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future<void> logOut()async  {
  try{
    await profileRemoteDataSource.signOut();
  }catch(e){
    print("Error during logout: $e"); 
  }
  }
  
  @override
  Future<void> clearLocalStorage()async  {
    try{
      await profileLocalDataSource.clearLocalData();
    }catch(e){
      print("Error clearing local storage: $e");
    }
  }
}
