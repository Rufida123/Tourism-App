class FlightReturnListModel {
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
  final double? finalRating;
  final int departureReturnId;
  final int? returnFlightId;

  // final List<OfferModel> offers;
 
 


  FlightReturnListModel({
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
    required this.finalRating,
    required this.departureReturnId,
    required this.returnFlightId,
  
    // required this.offers,
 
   
    
  
  });

  factory FlightReturnListModel.fromJson(Map<String, dynamic> json) {
  //     final List<dynamic> flightDataList = json['offer'];
  // final List<OfferModel> offerList = flightDataList
  //     .map((flightJson) => OfferModel.fromJson(flightJson))
  //     .toList();
   
    return FlightReturnListModel(
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
      finalRating: json['final_rating'],
      departureReturnId: json['departure_return_id'],
      returnFlightId: json['return_flight_id'],
  
      //  offers: offerList,
      
      
      
     
    );
    
  }
}