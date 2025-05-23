class AppUser {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final bool isOnline;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.isOnline,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      isOnline: json['isOnline'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'isOnline': isOnline,
    };
  }
}
