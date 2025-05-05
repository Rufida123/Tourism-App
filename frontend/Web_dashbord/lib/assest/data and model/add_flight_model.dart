class AddFlightModel {
  final String? departureAirport;
  final String? arrivalAirport;
  final String? companyName;
  final String? departureDate;
  final String? arrivalDate;
  final String? departureTime;
  final String? arrivalTime;
  final String? typeTrip;
  final String? priceOfTicket;
  final String? passengerCount;
  final String? departureReturnId;

  AddFlightModel(
      this.departureAirport,
      this.arrivalAirport,
      this.companyName,
      this.departureDate,
      this.arrivalDate,
      this.departureTime,
      this.arrivalTime,
      this.typeTrip,
      this.priceOfTicket,
      this.passengerCount,
      this.departureReturnId);
  Map<String, dynamic> toJson() {
    return {
      'departure_airport': departureAirport,
      'arrival_airport': arrivalAirport,
      'company_name': companyName,
      'departure_date': departureDate,
      'arrival_date': arrivalDate,
      'departure_time': departureTime,
      'arrival_time': arrivalTime,
      'type_id': typeTrip,
      'price_of_tickets': priceOfTicket,
      'passenger_count': passengerCount,
      'departure_return_id': departureReturnId
    };
  }
}
