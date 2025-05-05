class TripFavoriteModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final int finalRating;
  final String MaximumParticipants;
  final String startDate;
  final String endDate;
  final String tripType;
  final String price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PhotoModel photos;
  final OfferModel offers;

  TripFavoriteModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.finalRating,
    required this.MaximumParticipants,
    required this.startDate,
    required this.endDate,
    required this.tripType,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
    required this.offers,
  });
  factory TripFavoriteModel.fromJson(Map<String, dynamic> json) {
    return TripFavoriteModel(
        id: json['id'],
        phone: json['phone'],
        email: json['email'],
        name: json['name'],
        MaximumParticipants: json['MaximumParticipants'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        location: json['location'],
        tripType: json['tripType'],
        price: json['price'],
        finalRating: json['final_rating'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        photos: PhotoModel.fromJson(json['photo']),
        offers: OfferModel.fromJson(json['offers'][0]));
  }
}

class PhotoModel {
  final String relativePath;

  PhotoModel({
    required this.relativePath,
  });
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      relativePath: json['RelativePath'],
    );
  }
}

class OfferModel {
  final int id;
  final String status;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String discountRate;
  final double discountValue;

  OfferModel({
    required this.id,
    required this.status,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.discountRate,
    required this.discountValue,
  });
  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'],
      status: json['status'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      discountRate: json['discount_rate'],
      discountValue: json['discount_value'].toDouble(),
    );
  }
}
