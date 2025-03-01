import 'package:userapp/features/auth/user/domain/entity/user_account.dart';

class UserAccountModel extends UserAccount {
  UserAccountModel({
    required super.uid,
    required super.email,
    required super.profileurl,
    super.gender,
    super.dataOfBirth,
    super.height,
    super.weight,
  });

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      profileurl: json['profileurl'] as String,
      gender: json['gender'] as String?,
      dataOfBirth: json['dataOfBirth'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
    );
  }
}
