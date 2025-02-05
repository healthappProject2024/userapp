// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:userapp/features/onboarding/data/local_data_source/local_data_source.dart';
// import 'package:userapp/utils/const/local_data_helper.dart/sharedpreference_helper.dart';
// import 'package:userapp/utils/service/local_data_service.dart';

// class MockLocalDataService extends Mock implements LocalDataService {}

// void main() {
//   group("Local Data source test", () {
//     late MockLocalDataService mockLocalDataService;
//     late LocalDataSource localDataSource;
//     const String testKey = SharedpreferenceHelper.onboarding;
    
//     setUp(() {
//       mockLocalDataService = MockLocalDataService();
//       localDataSource =
//           LocalDataSourceImpl(localDataService: mockLocalDataService);
//     });
//     test(
//         "given the user has completed the onboarding process, When the hasCompletedOnboarding method is called,Then it should return true",
//         () async {
//       await mockLocalDataService.setBoolValue(testKey);
//       when(mockLocalDataService.getBoolValue(testKey)).thenReturn(true);
//       final result = await localDataSource.hasCompletedOnboarding();
//       expect(result, true);
//     });
//   });
// }
