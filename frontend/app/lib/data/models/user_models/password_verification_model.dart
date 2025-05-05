class PassVerifiUserModel {
  String email;
  String code;
  PassVerifiUserModel({required this.email, required this.code});
  Map<String, String> toJson() {
    return {'email': email, 'code': code};
  }
}
