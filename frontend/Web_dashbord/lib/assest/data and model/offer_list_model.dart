

class OfferListModel {
    final int id;
  final String status;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String discountRate;
  final int discountValue;
  final String offerableType;
  final int offerableId;



  
  //  final List<OfferModel> offers;
  
   
 
 

   OfferListModel({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.description,
    required this.discountRate,
    required this.discountValue,
    required this.offerableType,
    required this.offerableId,
    required this.status,
 
   
  
    // required this.offers,

   
    
  
  });

  factory  OfferListModel.fromJson(Map<String, dynamic> json) {
  //   final List<dynamic> flightDataList = json['offer'];
  // final List<OfferModel> offerList = flightDataList
  //     .map((flightJson) => OfferModel.fromJson(flightJson))
  //     .toList();
   
    return  OfferListModel(
     id: json['id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      title: json['title'],
      description: json['description'],
      discountRate: json['discount_rate'],
      discountValue: json['discount_value'],
      offerableType: json['offerable_type'],
      offerableId: json['offerable_id'],
      status: json['status'],
     
     
      // offers: offerList,
         
    
    );
  }
}