class ReservationFlightModel {
  final int id;
  final int userId;
  final int flightId;
  final int numOfAdult;
  final int numOfChild;
  final String totalPrice;
  final String status;
  final int phone;

  ReservationFlightModel({
    required this.id,
    required this.userId,
    required this.flightId,
    required this.numOfAdult,
    required this.numOfChild,
    required this.totalPrice,
    required this.status,
    required this.phone,
  });

  factory ReservationFlightModel.fromJson(Map<String, dynamic> json) {
    return ReservationFlightModel(
      id: json['id'],
      userId: json['user_id'],
      flightId: json['Flight_id'],
      numOfAdult: json['num_of_adult'],
      numOfChild: json['num_of_child'],
      totalPrice: json['total_price'],
      status: json['states'],
      phone: json['phone'],
    );
  }
}
