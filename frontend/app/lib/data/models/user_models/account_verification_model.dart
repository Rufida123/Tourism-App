class AccVerifiUserModel {
  String email;
  String code;
  AccVerifiUserModel({
    required this.email,
    required this.code,
  });
  Map<String, String> toJson() {
    return {
      'email': email,
      'code': code,
    };
  }
}
