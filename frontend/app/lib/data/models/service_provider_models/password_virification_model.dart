class PassVerifiProviderModel {
  String email;
  String code;
  PassVerifiProviderModel({required this.email, required this.code});
  Map<String, String> toJson() {
    return {'email': email, 'code': code};
  }
}
