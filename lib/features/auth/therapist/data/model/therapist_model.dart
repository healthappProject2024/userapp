import 'package:userapp/features/auth/therapist/domain/entity/therapist.dart';

class TherapistModel extends Therapist {
  TherapistModel({
    required super.uid,
    required super.name,
    required super.profileurl,
    required super.email,
  });

 factory TherapistModel.fromJson(Map<String, dynamic> json,String uid) {
    return TherapistModel(
      uid: uid,
      name: json['name'] as String,
      email: json['email'] as String,
      profileurl: json['profileurl'] as String,
    );
  }
}
