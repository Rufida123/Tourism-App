class HotelFavoriteModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final double finalRating;
  final double priceForNight;

  final DateTime createdAt;
  final DateTime updatedAt;
  final PhotoModel photos;
  final OfferModel offers;

  HotelFavoriteModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.finalRating,
    required this.priceForNight,
    required this.createdAt,
    required this.updatedAt,
    required this.photos,
    required this.offers,
  });
  factory HotelFavoriteModel.fromJson(Map<String, dynamic> json) {
    return HotelFavoriteModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        location: json['location'],
        finalRating: json['final_rating'].toDouble(),
        priceForNight: json['priceforNight'].toDouble(),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        photos: PhotoModel.fromJson(json['photo'][0]),
        offers: OfferModel.fromJson(json['offers'][0]));
  }
}

class PhotoModel {
  final int id;
  final String relativePath;
  final String name;
  final String absolutePath;
  final String imageHttpLink;

  PhotoModel({
    required this.id,
    required this.relativePath,
    required this.name,
    required this.absolutePath,
    required this.imageHttpLink,
  });
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      relativePath: json['RelativePath'],
      name: json['name'],
      absolutePath: json['AbsolutePath'],
      imageHttpLink: json['ImageHttpLink'],
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
