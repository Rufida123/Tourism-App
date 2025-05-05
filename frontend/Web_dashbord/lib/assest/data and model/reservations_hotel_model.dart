class ReservationHotelModel {
  final int id;
  final String numberOfDay;
  final String numberRoom;
  final String firstName;
  final String checkIn;
  final String checkOut;
  final int payment;
  final String status;
  final int roomId;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  ReservationHotelModel({
    required this.id,
    required this.numberOfDay,
    required this.numberRoom,
    required this.firstName,
    required this.checkIn,
    required this.checkOut,
    required this.payment,
    required this.status,
    required this.roomId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReservationHotelModel.fromJson(Map<String, dynamic> json) {
    return ReservationHotelModel(
      id: json['id'],
      numberOfDay: json['numberOFday'],
      numberRoom: json['numberroom'],
      firstName: json['first_name'],
      checkIn: json['checkin'],
      checkOut: json['checkout'],
      payment: json['payment'],
      status: json['status'],
      roomId: json['room_id'],
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
