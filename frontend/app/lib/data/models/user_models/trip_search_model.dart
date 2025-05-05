class TripSearchFilterModel {
  final int id;
  final String phone;
  final String email;
  final String name;
  final int maximumParticipants;
  final String startDate;
  final String endDate;
  final String location;
  final String tripType;
  final double price;
  final int isFavourite;
  final int finalRating;
  final String createdAt;
  final String updatedAt;
  final Photo photo;
  final Offer offers;

  TripSearchFilterModel(
      {required this.id,
      required this.phone,
      required this.email,
      required this.name,
      required this.maximumParticipants,
      required this.startDate,
      required this.endDate,
      required this.location,
      required this.tripType,
      required this.price,
      required this.isFavourite,
      required this.finalRating,
      required this.createdAt,
      required this.updatedAt,
      required this.photo,
      required this.offers});
  factory TripSearchFilterModel.fromJson(Map<String, dynamic> json) {
    return TripSearchFilterModel(
        id: json['id'] as int,
        phone: json['phone'] as String,
        email: json['email'] as String,
        name: json['name'] as String,
        maximumParticipants: int.parse(json['MaximumParticipants']),
        startDate: json['startDate'] as String,
        endDate: json['endDate'] as String,
        location: json['location'] as String,
        tripType: json['tripType'] as String,
        price: double.parse(json['price']),
        isFavourite: json['isFavourite'] as int,
        finalRating: json['final_rating'],
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        photo: Photo.fromJson(json['photo']),
        offers: Offer.fromJson(json['offers'][0]));
  }
}

class Photo {
  final int id;
  final String relativePath;
  final String name;
  final String absolutePath;
  final String imageHttpLink;

  Photo({
    required this.id,
    required this.relativePath,
    required this.name,
    required this.absolutePath,
    required this.imageHttpLink,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      relativePath: json['RelativePath'] as String,
      name: json['name'] as String,
      absolutePath: json['AbsolutePath'] as String,
      imageHttpLink: json['ImageHttpLink'] as String,
    );
  }
}

class Offer {
  final int id;
  final String status;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String discountRate;
  final double discountValue;

  Offer({
    required this.id,
    required this.status,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.discountRate,
    required this.discountValue,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'] as int,
      status: json['status'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      discountRate: json['discount_rate'] as String,
      discountValue: double.parse(json['discount_value'].toString()),
    );
  }
}

class TripSearchFillterRequestModel {
  final String? name;
  final String? location;
  final String? rating;
  final String? maxPrice;
  final String? minPrice;
  final String? tripType;

  TripSearchFillterRequestModel(this.name, this.rating, this.maxPrice,
      this.minPrice, this.tripType, this.location);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (rating != null) data['final_rating'] = rating;
    if (maxPrice != null) data['maxPrice'] = maxPrice;
    if (minPrice != null) data['minPrice'] = minPrice;
    if (tripType != null) data['checkout'] = tripType;
    if (location != null) data['location'] = location;
    return data;
  }
}
