class UserAccount {
  final String uid;
  final String email;
  final String profileurl;
  final String? gender;
  final String? dataOfBirth;
  final double? height;
  final double? weight;

  UserAccount({
    required this.uid,
    required this.email,
    required this.profileurl,
    this.gender,
    this.dataOfBirth,
    this.height,
    this.weight,
  });

    Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'profileurl': profileurl,
      'gender': gender,
      'dataOfBirth': dataOfBirth,
      'height': height,
      'weight': weight,
    };
  }
}
