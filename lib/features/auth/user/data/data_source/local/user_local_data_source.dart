import 'package:userapp/utils/const/local_data_helper.dart/sharedpreference_helper.dart';
import 'package:userapp/utils/service/local_data_service.dart';

abstract interface class UserLocalDataSource {
  Future<void> cacheUser(String model);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final LocalDataService localDataService;

  UserLocalDataSourceImpl(this.localDataService);

  @override
  Future<void> cacheUser(String model) async {
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