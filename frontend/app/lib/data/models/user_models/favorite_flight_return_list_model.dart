
class FlightReturnFavoriteModel {
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
  final DateTime createdAt;
  final DateTime updatedAt;
  final Pivot? pivot;
//  final List<OfferModel> offers;
 
 

 
 
  FlightReturnFavoriteModel({
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
    this.finalRating,
    required this.departureReturnId,
    this.returnFlightId,
    required this.createdAt,
    required this.updatedAt,
    this.pivot,
    // required this.offers,
   
  
  });
  factory FlightReturnFavoriteModel.fromJson(Map<String, dynamic> json) {
//       var list = json['offer'] as List;
// print(list.runtimeType); 
// List<OfferModel> offerList = list.map((x) => OfferModel.fromJson(x)).toList();
    return FlightReturnFavoriteModel(
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
      finalRating: json['final_rating'] != null ? json['final_rating'].toDouble() : null,
      departureReturnId: json['departure_return_id'],
      returnFlightId: json['return_flight_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pivot: json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null,
      // offers: offerList,
      
    );
      
        
        
      
  }
}
class Pivot {
  final int userId;
  final int flightId;

  Pivot({required this.userId, required this.flightId});

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      userId: json['user_id'],
      flightId: json['fligt_id'],
    );
  }
}

  

  





// class OfferModel {
//   final int id;
//   final String status;
//   final String title;
//   final String description;
//   final DateTime startDate;
//   final DateTime endDate;
//   final String discountRate;
//   final double discountValue;

//   OfferModel({
//     required this.id,
//     required this.status,
//     required this.title,
//     required this.description,
//     required this.startDate,
//     required this.endDate,
//     required this.discountRate,
//     required this.discountValue,
//   });
//   factory OfferModel.fromJson(Map<String, dynamic> json) {
//     return OfferModel(
//       id: json['id'],
//       status: json['status'],
//       title: json['title'],
//       description: json['description'],
//       startDate: DateTime.parse(json['start_date']),
//       endDate: DateTime.parse(json['end_date']),
//       discountRate: json['discount_rate'],
//       discountValue: json['discount_value'].toDouble(),
//     );
//   }
// }