class HotelSearchFillterModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final bool isFavorite;
  final int rating;
  final int price;
  final HotelPhotoModel image;
  final HotelOfferModel offer;

  HotelSearchFillterModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.isFavorite,
    required this.rating,
    required this.price,
    required this.image,
    required this.offer,
  });

  factory HotelSearchFillterModel.fromJson(Map<String, dynamic> json) {
    return HotelSearchFillterModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        location: json['location'],
        isFavorite: json['isFavourite'] == 1,
        rating: json['final_rating'],
        price: json['priceforNight'],
        image: HotelPhotoModel.fromJson(json['photo'][0]),
        offer: HotelOfferModel.fromJson(json['offers'][0]));
  }
}

class HotelPhotoModel {
  final int id;
  final String relativePath;
  final String name;
  final String absolutePath;
  final String imageHttpLink;
  final String photoableType;
  final int photoableId;
  final DateTime createdAt;
  final DateTime updatedAt;

  HotelPhotoModel({
    required this.id,
    required this.relativePath,
    required this.name,
    required this.absolutePath,
    required this.imageHttpLink,
    required this.photoableType,
    required this.photoableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HotelPhotoModel.fromJson(Map<String, dynamic> json) {
    return HotelPhotoModel(
      id: json['id'],
      relativePath: json['RelativePath'],
      name: json['name'],
      absolutePath: json['AbsolutePath'],
      imageHttpLink: json['ImageHttpLink'],
      photoableType: json['photoable_type'],
      photoableId: json['photoable_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class HotelOfferModel {
  final int id;
  final String status;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String discountRate;
  final double discountValue;
  final String offerableType;
  final int offerableId;
  final DateTime createdAt;
  final DateTime updatedAt;

  HotelOfferModel({
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

  factory HotelOfferModel.fromJson(Map<String, dynamic> json) {
    return HotelOfferModel(
      id: json['id'],
      status: json['status'],
      title: json['title'],
      description: json['description'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      discountRate: json['discount_rate'],
      discountValue: json['discount_value'].toDouble(),
      offerableType: json['offerable_type'],
      offerableId: json['offerable_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class HotelSearchFillterRequestModel {
  final String? name;
  final String? location;
  final String? roomType;
  final String? checkin;
  final String? checkout;
  final String? rating;
  final String? feature;

  HotelSearchFillterRequestModel(this.name, this.location, this.roomType,
      this.checkin, this.checkout, this.rating, this.feature);
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (location != null) data['location'] = location;
    if (roomType != null) data['name_roomType'] = roomType;
    if (checkin != null) data['checkin'] = checkin;
    if (checkout != null) data['checkout'] = checkout;
    if (rating != null) data['final_rating'] = rating;
    if (feature != null) data['name_feature'] = feature;
    return data;
  }
}
