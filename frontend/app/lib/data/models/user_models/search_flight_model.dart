




class FlightSearchModel {
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

  FlightSearchModel({
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

  factory FlightSearchModel.fromJson(Map<String, dynamic> json) {
    return FlightSearchModel(
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

class FlightSearchRequestModel{
final String searchQuery;


FlightSearchRequestModel( {required this.searchQuery});
Map<String, String> toJson() {
    return {
      'search_query': searchQuery,
    };
  }
}