class ForgotPassUserModel {
  String email;
  ForgotPassUserModel({
    required this.email,
  });
  Map<String, String> toJson() {
    return {
      'email': email,
    };
  }
}
