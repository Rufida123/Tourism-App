class AddHotelModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? location;
  final String? priceforNight;

  AddHotelModel(
    this.name,
    this.email,
    this.phone,
    this.location,
    this.priceforNight,
  );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'priceforNight': priceforNight,
    };
  }
}
