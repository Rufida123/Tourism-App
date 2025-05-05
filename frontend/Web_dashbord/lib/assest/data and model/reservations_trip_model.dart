class ReservationTripModel {
  final int id;
  final String firstName;
  final int payment;
  final String lastName;
  final String numberPeople;
  final String notes;
  final String status;
  final int tripId;
  final int userId;

  ReservationTripModel({
    required this.id,
    required this.firstName,
    required this.payment,
    required this.lastName,
    required this.numberPeople,
    required this.notes,
    required this.status,
    required this.tripId,
    required this.userId,
  });

  factory ReservationTripModel.fromJson(Map<String, dynamic> json) {
    return ReservationTripModel(
      id: json['id'],
      firstName: json['first_name'],
      payment: json['payment'],
      lastName: json['lastname'],
      numberPeople: json['numberpeople'],
      notes: json['notes'],
      status: json['status'],
      tripId: json['trip_id'],
      userId: json['user_id'],
    );
  }
}
