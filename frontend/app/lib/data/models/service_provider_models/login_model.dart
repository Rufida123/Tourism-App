class LoginProviderModel {
  final String email;
  final String password;

  LoginProviderModel({required this.email, required this.password});

  Map<String, String> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
