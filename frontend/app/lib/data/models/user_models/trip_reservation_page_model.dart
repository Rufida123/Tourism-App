class TripReservationPageModel {
  final int id;
  final String firstName;
  final int payment;
  final String lastName;
  final String numberOfPeople;
  final String notes;

  TripReservationPageModel({
    required this.id,
    required this.firstName,
    required this.payment,
    required this.lastName,
    required this.numberOfPeople,
    required this.notes,
  });

  factory TripReservationPageModel.fromJson(Map<String, dynamic> json) {
    return TripReservationPageModel(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      payment: json['payment'],
      lastName: json['lastname'],
      numberOfPeople: json['numberpeople'] as String,
      notes: json['notes'] as String,
    );
  }
}
