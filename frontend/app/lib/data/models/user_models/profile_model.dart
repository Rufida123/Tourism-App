class ProfileModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String emailVerifiedAt;
  // final String image;
  // final String deviceToken;
  final int wallet;
  // final String phone; // phone as int
  final String createdAt;
  final String updatedAt;
  // final String photos;

  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.emailVerifiedAt,
    // required this.image,
    // required this.deviceToken,
    required this.wallet,
    // required this.phone,
    required this.createdAt,
    required this.updatedAt,
    // required this.photos,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      // image: json['image'],
      // deviceToken: json['device_token'],
      wallet: json['wallet'],
      // phone: json['phone'] , // Ensure phone is an int
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      // photos: json['photos'],
    );
  }
}

class ProfileRequestModel {
  final String firstName;
  final String lastName;

  ProfileRequestModel({required this.firstName, required this.lastName});
  Map<String, String> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      // No need to convert to String here, as the type is dynamic
    };
  }
}
