class FlightFilterModel {
  final int id;
  final String departureAirport;
  final String arrivalAirport;
  final String companyName;
  final String departureDate;
  final String arrivalDate;
  final String departureTime;
  final String arrivalTime;
  final int typeId;
  final String status;
  final String priceOfTickets;
  final int passengerCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  FlightFilterModel({
    required this.id,
    required this.departureAirport,
    required this.arrivalAirport,
    required this.companyName,
    required this.departureDate,
    required this.arrivalDate,
    required this.departureTime,
    required this.arrivalTime,
    required this.typeId,
    required this.status,
    required this.priceOfTickets,
    required this.passengerCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FlightFilterModel.fromJson(Map<String, dynamic> json) {
    return FlightFilterModel(
      id: json['id'],
      departureAirport: json['departure_airport'],
      arrivalAirport: json['arrival_airport'],
      companyName: json['company_name'],
      departureDate: json['departure_date'],
      arrivalDate: json['arrival_date'],
      departureTime: json['departure_time'],
      arrivalTime: json['arrival_time'],
      typeId: json['type_id'],
      status: json['status'],
      priceOfTickets: json['price_of_tickets'],
      passengerCount: json['passenger_count'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
class FlightFilterRequestModel{
final String departureDateStart;
final String departureDateEnd;
final String minPrice;
final String maxPrice;
final String airlineName;


FlightFilterRequestModel( {required this.departureDateStart,required this.departureDateEnd,required this.minPrice,required this.maxPrice,required this.airlineName});
Map<String, String> toJson() {
    return {
      'departure_date_start': departureDateStart,
      'departure_date_end':departureDateEnd,
      'min_price':minPrice,
      'max_price':maxPrice,
      'airline_name':airlineName

    };
  }
}
