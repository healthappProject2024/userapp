import 'package:userapp/utils/const/local_data_helper.dart/sharedpreference_helper.dart';
import 'package:userapp/utils/service/local_data_service.dart';

abstract interface class LocalDataSource {
Future<void> markOnboardingComplete();
Future<bool> hasCompletedOnboarding();

}

class LocalDataSourceImpl implements LocalDataSource{
  final LocalDataService localDataService;

  LocalDataSourceImpl({required this.localDataService});

  @override
  Future<bool> hasCompletedOnboarding() async {
    try{
      final status = localDataService.getBoolValue(SharedpreferenceHelper.onboarding);
      return status;
    } catch(e){
      print(e.toString());
      return false;
    }
  }

  @override
  Future<void> markOnboardingComplete() async {
    try{
      await localDataService.setBoolValue(SharedpreferenceHelper.onboarding);
    } catch(e){
      Exception(e.toString());
    }
  }
  
}