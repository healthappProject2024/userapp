import 'package:userapp/features/auth/therapist/domain/entity/therapist.dart';

class TherapistModel extends Therapist {
  TherapistModel({
    required super.uid,
    required super.name,
    required super.email,
  });
  factory TherapistModel.fromJson(Map<String, dynamic> json) {
    return TherapistModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}
