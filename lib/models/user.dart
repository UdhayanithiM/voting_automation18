class User {
  final int id;
  final String email;
  final String password;

  User({required this.id, required this.email, required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
