class AccVerifiProviderModel {
  String email;
  String code;
  AccVerifiProviderModel({
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
