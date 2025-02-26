import 'dart:convert';

import 'package:userapp/features/therapist/therapist_profile_page/data/model/user_model.dart';
import 'package:userapp/utils/const/local_data_helper.dart/sharedpreference_helper.dart';
import 'package:userapp/utils/service/local_data_service.dart';

abstract interface class ProfileLocalDataSource {
  Future<ProfileUserModel?> fetchUser();
  Future<void> clearLocalData();
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final LocalDataService localDataService;

  ProfileLocalDataSourceImpl(this.localDataService);

  @override
  Future<ProfileUserModel?> fetchUser() async {
    try {
      final userString =
          localDataService.getString(SharedpreferenceHelper.userData);
      if (userString.isEmpty) {
        return null;
      }
      final jsonUser = json.decode(userString);
      return ProfileUserModel.fromJson(jsonUser);
    } catch (e) {
      return null;
    }
  }
  
  @override
  Future<void> clearLocalData() async {
    try{
      await localDataService.clearData(SharedpreferenceHelper.loginStatus);
      await localDataService.clearData(SharedpreferenceHelper.role);
      await localDataService.clearData(SharedpreferenceHelper.userData);
    }catch(e){
       print("Error clearing local data: $e");
    }
  }
}
