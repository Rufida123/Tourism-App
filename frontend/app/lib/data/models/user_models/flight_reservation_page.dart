class FlightReservationPageModel {
  final int id;
  final int userId;
  final int flightId;
  final int numOfAdult;
  final int numOfChild;
  final String totalPrice;
  final String state;
  final int phone;
  final DateTime createdAt;
  final DateTime updatedAt;

  FlightReservationPageModel({
    required this.id,
    required this.userId,
    required this.flightId,
    required this.numOfAdult,
    required this.numOfChild,
    required this.totalPrice,
    required this.state,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FlightReservationPageModel.fromJson(Map<String, dynamic> json) {
    return FlightReservationPageModel(
      id: json['id'],
      userId: json['user_id'],
      flightId: json['Flight_id'],
      numOfAdult: json['num_of_adult'],
      numOfChild: json['num_of_child'],
      totalPrice: json['total_price'],
      state: json['states'],
      phone: json['phone'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
