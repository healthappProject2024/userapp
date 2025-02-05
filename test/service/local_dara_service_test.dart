import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/utils/const/local_data_helper.dart/sharedpreference_helper.dart';
import 'package:userapp/utils/service/local_data_service.dart';

void main() {
  group('Local Data Service class testing', () {
    late LocalDataService localDataService;
    const String testKey = SharedpreferenceHelper.onboarding;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      final SharedPreferences pref = await SharedPreferences.getInstance();
      localDataService = LocalDataService(prefs: pref);
    });

    test('Given that no value is stored in SharedPreferences, when the value is retrieved, then it should return false.', () async {
      const expectedValue = false;
      final actualValue = localDataService.getBoolValue(testKey);
      expect(actualValue, expectedValue);
    });

    test('Given a key, when the method stores a true value, then it should return true', () async {
      const expectedValue = true;
      final actualValue = await localDataService.setBoolValue(testKey);
      expect(actualValue, expectedValue);
    });

    test('Given a key when a true value is stored, then the retrieved value should be true.', () async {
      await localDataService.setBoolValue(testKey);
      const expectedValue = true;
      final actualValue = localDataService.getBoolValue(testKey);
      expect(actualValue, expectedValue);
    });
  });
}
