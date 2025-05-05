class HotelEditReservationModel {
  final String? reservationId;
  final String? checkin;
  final String? checkout;
  final String? numberOFday;
  final String? firstName;
  final String? numberRoom;

  HotelEditReservationModel(this.reservationId, this.checkin, this.checkout,
      this.numberOFday, this.firstName, this.numberRoom);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (reservationId != null) data['reservation_id'] = reservationId;
    if (checkin != null) data['checkin'] = checkin;
    if (checkout != null) data['checkout'] = checkout;
    if (numberOFday != null) data['numberOFday'] = numberOFday;
    if (firstName != null) data['first_name'] = firstName;
    if (numberRoom != null) data['numberroom'] = numberRoom;
    return data;
  }
}
