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
  bool isFavorite;
   List<String> discountRates;
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
    required this.isFavorite,
    required this.discountRates,
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
      
      isFavorite: json['is_favorite'],
       discountRates: List<String>.from(json['discount_rates']),
      //  offers: offerList,
      
      
      
     
    );
    
  }
}

class OfferModel {
   final int id;
  final String status;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String discountRate;
  final String discountValue;
  final String offerableType;
  final int offerableId;
  final String createdAt;
  final String updatedAt;

  OfferModel({
    required this.id,
    required this.status,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.discountRate,
    required this.discountValue,
    required this.offerableType,
    required this.offerableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      status: json['status'],
      title: json['title'],
      description: json['description'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      discountRate: json['discount_rate'],
      discountValue: json['discount_value'],
      offerableType: json['offerable_type'],
      offerableId: json['offerable_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
  
}

