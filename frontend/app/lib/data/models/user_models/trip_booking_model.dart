class TripBookingModel {
  final String? firstName;
  final String? lastName;
  final String? numberOfPeople;
  final String? notes;

  TripBookingModel(
    this.firstName,
    this.lastName,
    this.numberOfPeople,
    this.notes,
  );
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'lastname': lastName,
      'numberpeople': numberOfPeople,
      'notes': notes,
    };
  }
}
