import 'package:userapp/features/therapist/add-user/domain/entity/user.dart';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.imageUrl,
    required super.therapisName,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      "email": email,
      "profileurl": imageUrl,
      'role': "user",
      "therapistName" : therapisName,
    };
  }
}
