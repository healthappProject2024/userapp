class Therapist {
  final String name;
  final String email;
  final String profileurl;

  Therapist({
    required this.name,
    required this.email,
    required this.profileurl,
  });
    Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "profileurl": profileurl,
    };
  }
    factory Therapist.fromJson(Map<String, dynamic> json) {
    return Therapist(
      name: json['name'] as String,
      email: json['email'] as String,
      profileurl: json['profileurl'] as String,
    );
  }
}
