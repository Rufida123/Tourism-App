class UsersModel {
  final String firstName;
  final String lastName;
  final String wallet;
  final int id;

  UsersModel(
      {required this.firstName,
      required this.lastName,
      required this.wallet,
      required this.id});
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        wallet: json['wallet'] as String,
        id: json['id'] as int);
  }
}
