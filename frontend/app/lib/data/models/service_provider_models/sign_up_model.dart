class SignUpProviderModel {
  final String Name;
  final String email;
  final String password;
  final String confirmPassword;
  final String commercialNumber;

  SignUpProviderModel(
      {required this.Name,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.commercialNumber});

  Map<String, String> toJson() {
    return {
      'provider_name': Name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'commercial_register': commercialNumber
    };
  }
}
