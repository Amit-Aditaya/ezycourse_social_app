class LoginResponse {
  final String type;
  final String token;

  LoginResponse({required this.type, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      type: json['type'],
      token: json['token'],
    );
  }
}
