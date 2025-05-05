class FlightEditReservationModel {
  final String? NumberOfAdults;
  final String? NumberOfChildren;
  final String? phone;

  FlightEditReservationModel(
    this.NumberOfAdults,
    this.NumberOfChildren,
    this.phone,
  );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (NumberOfAdults != null) data['num_of_adult'] = NumberOfAdults;
    if (NumberOfChildren != null) data['num_of_child'] = NumberOfChildren;
    if (phone != null) data['phone'] = phone;

    return data;
  }
}
