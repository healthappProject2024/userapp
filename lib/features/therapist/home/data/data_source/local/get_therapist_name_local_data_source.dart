import 'dart:convert';
import 'package:userapp/utils/const/local_data_helper.dart/sharedpreference_helper.dart';
import 'package:userapp/utils/service/local_data_service.dart';

abstract interface class GetTherapistNameLocalDataSource {
  Future<String> getTherapistName();
}

class GetTherapistNameLocalDataSourceImpl
    implements GetTherapistNameLocalDataSource {
  final LocalDataService localDataService;

  GetTherapistNameLocalDataSourceImpl(this.localDataService);

  @override
  Future<String> getTherapistName() async {
    try {
      final jsonString = localDataService.getString(SharedpreferenceHelper.userData);

      if (jsonString.isNotEmpty) {
        final Map<String, dynamic> therapistMap = jsonDecode(jsonString);
        return therapistMap["name"] ?? "Unknown Therapist";
      } else {
        return "No Therapist Data Found";
      }
    } catch (e) {
      print("Error decoding therapist data: $e");
      return "Error retrieving therapist name";
    }
  }
}
