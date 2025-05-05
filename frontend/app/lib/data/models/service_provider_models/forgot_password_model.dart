class ForgotPassProviderModel {
  String email;
  ForgotPassProviderModel({
    required this.email,
  });
  Map<String, String> toJson() {
    return {
      'email': email,
    };
  }
}
