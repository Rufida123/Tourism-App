class EditTripOutDetailsModel {
  final String? name;
  final String? phone;
  final String? email;
  final String? location;
  final String? price;
  final String? tripType;
  final String? maximumParticipants;
  final String? startDate;
  final String? endDate;

  EditTripOutDetailsModel(
    this.name,
    this.phone,
    this.email,
    this.location,
    this.price,
    this.tripType,
    this.maximumParticipants,
    this.startDate,
    this.endDate,
  );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'location': location,
      'price': price,
      'tripType': tripType,
      'MaximumParticipants': maximumParticipants,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
