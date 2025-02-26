import 'package:userapp/features/therapist/therapist_profile_page/domain/entity/user.dart';

class ProfileUserModel extends ProfileUser {
  ProfileUserModel( {
    required super.uid,
    required super.name,
    required super.email,
    required super.profileurl,
  });

    factory ProfileUserModel.fromJson(Map<String, dynamic> json) {
    return ProfileUserModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileurl: json['profileurl'] as String,
    );
  }
}
