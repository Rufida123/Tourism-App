class HotelBookingModel {
  final String? checkin;
  final String? checkout;
  final String? numberOFday;
  final String? firstName;
  final String? numberroom;

  HotelBookingModel(
    this.checkin,
    this.checkout,
    this.numberOFday,
    this.firstName,
    this.numberroom,
  );
  Map<String, dynamic> toJson() {
    return {
      'checkin': checkin,
      'checkout': checkout,
      'numberOFday': numberOFday,
      'first_name': firstName,
      'numberroom': numberroom,
    };
  }
}
