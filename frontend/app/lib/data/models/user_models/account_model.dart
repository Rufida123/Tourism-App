class AccountModel {
  final String firstName;
  final String emailVerifiedAt;
  final String lastName;
  final String email;
  // final String image;
  final int wallet;
  final String phone;
  final String createdAt;
  final String updatedAt;
  // final String photos;

  AccountModel({
    required this.firstName,
    required this.emailVerifiedAt,
    required this.lastName,
    required this.email,
    // required this.image,
    required this.wallet,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    // required this.photos,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      firstName: json['first_name'],
      emailVerifiedAt: json['email_verified_at'],
      lastName: json['last_name'],
      email: json['email'],
      // image: json['image'],
      wallet: json['wallet'],
      phone: json['phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      // photos: json['photos'],
    );
  }
}
