class Therapist {
  final String uid;
  final String name;
  final String email;
  final String profileurl;

  Therapist({
    required this.uid,
    required this.name,
    required this.email,
    required this.profileurl,
  });
    Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
      "profileurl": profileurl,
    };
  }
  //   factory Therapist.fromJson(Map<String, dynamic> json) {
  //   return Therapist(
  //     uid: json['uid'] as String,
  //     name: json['name'] as String,
  //     email: json['email'] as String,
  //     profileurl: json['profileurl'] as String,
  //   );
  // }
}
