class FlightRatingResponseModel {
  final String message;

 
  
  
  
 

  FlightRatingResponseModel({
    required this.message,
  
    
    
   
  });

  factory FlightRatingResponseModel.fromJson(Map<String, dynamic> json) {
    return FlightRatingResponseModel(
      message: json['message'] as String,
      
     
      
    
      
    );
  }
}

class FlightRatingRequestModel {
  final int rating;

  FlightRatingRequestModel({required this.rating});
  Map<String, String> toJson() {
    return {
      'rating': rating.toString(),
    };
  }
}
