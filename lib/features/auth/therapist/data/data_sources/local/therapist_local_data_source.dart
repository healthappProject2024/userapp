import 'package:userapp/utils/const/local_data_helper.dart/sharedpreference_helper.dart';
import 'package:userapp/utils/service/local_data_service.dart';

abstract interface class TherapistLocalDataSource {
  Future<void> cacheTherapist(String model);
}

class TherapistLocalDataSourceImpl implements TherapistLocalDataSource {
  final LocalDataService localDataService;

  TherapistLocalDataSourceImpl(this.localDataService);

  @override
  Future<void> cacheTherapist(String model) async {
    try {
      await localDataService.setString(
        key: SharedpreferenceHelper.userData,
        value: model,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
