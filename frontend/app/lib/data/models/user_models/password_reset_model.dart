class PassResetUserModel {
  String code;
  String password;
  String passwordConfirmation;
  PassResetUserModel(
      {required this.password,
      required this.code,
      required this.passwordConfirmation});
  Map<String, String> toJson() {
    return {
      'code': code,
      'password': password,
      'password_confirmation': passwordConfirmation
    };
  }
}
