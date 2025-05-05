class TripRatingResponseModel {
  final String message;
  final int addedRating;
  final int finalRating;

  TripRatingResponseModel({
    required this.message,
    required this.addedRating,
    required this.finalRating,
  });

  factory TripRatingResponseModel.fromJson(Map<String, dynamic> json) {
    return TripRatingResponseModel(
      message: json['message'] as String,
      addedRating: int.parse(json['AddedRating'] as String),
      finalRating: int.parse(json['final_rating'].toString()),
    );
  }
}

class TripRatingRequestModel {
  final int rating;

  TripRatingRequestModel({required this.rating});
  Map<String, String> toJson() {
    return {
      'rating': rating.toString(),
    };
  }
}
