class User{
  String role;
  bool isEmailVerified;
  String id;
  String name;
  String phone;
  String email;
  String token;

  User({
    required this.role,
    required this.isEmailVerified,
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.token,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      role: json['role'],
      isEmailVerified: json['isEmailVerified'],
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      token: json['token'],
    );
  }
}