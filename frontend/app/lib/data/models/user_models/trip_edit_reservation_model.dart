class TripEditReservationModel {
  final String? reservationId;
  final String? numberOfPeople;
  final String? firstName;
  final String? lastName;
  final String? notes;

  TripEditReservationModel(
      this.reservationId, this.numberOfPeople, this.firstName,this.lastName, this.notes);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (reservationId != null) data['reservation_id'] = reservationId;
    if (numberOfPeople != null) data['numberpeople'] = numberOfPeople;
    if (firstName != null) data['first_name'] = firstName;
    if (lastName != null) data['lastname'] = lastName;
    if (notes != null) data['notes'] = notes;
    return data;
  }
}
