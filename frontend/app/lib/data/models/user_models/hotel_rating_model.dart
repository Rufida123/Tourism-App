class HotelRatingResponseModel {
  final String message;
  final int addedRating;
  final int finalRating;

  HotelRatingResponseModel({
    required this.message,
    required this.addedRating,
    required this.finalRating,
  });

  factory HotelRatingResponseModel.fromJson(Map<String, dynamic> json) {
    return HotelRatingResponseModel(
      message: json['message'] as String,
      addedRating: int.parse(json['AddedRating'] as String),
      finalRating: int.parse(json['final_rating'].toString()),
    );
  }
}

class HotelRatingRequestModel {
  final int rating;

  HotelRatingRequestModel({required this.rating});
  Map<String, String> toJson() {
    return {
      'rating': rating.toString(),
    };
  }
}
