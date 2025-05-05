class HotelReservationPageModel {
  final int id;
  final String numberOfDays;
  final String numberOfRooms;
  final String firstName;
  final String checkInDate;
  final String checkOutDate;
  final int payment;
  final String status;
  final int roomId;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  HotelReservationPageModel({
    required this.id,
    required this.numberOfDays,
    required this.numberOfRooms,
    required this.firstName,
    required this.checkInDate,
    required this.checkOutDate,
    required this.payment,
    required this.status,
    required this.roomId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HotelReservationPageModel.fromJson(Map<String, dynamic> json) {
    return HotelReservationPageModel(
      id: json['id'] as int,
      numberOfDays: json['numberOFday'] as String,
      numberOfRooms: json['numberroom'] as String,
      firstName: json['first_name'] as String,
      checkInDate: json['checkin'] as String,
      checkOutDate: json['checkout'] as String,
      payment: json['payment'],
      status: json['status'] as String,
      roomId: json['room_id'] as int,
      userId: json['user_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
