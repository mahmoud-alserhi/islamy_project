class AuthModel {
  final String token;
  final String userId;
  final String email;

  const AuthModel({
    required this.token,
    required this.userId,
    required this.email,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    token: json['token'],
    userId: json['userId'],
    email: json['email'],
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'userId': userId,
    'email': email,
  };
}
