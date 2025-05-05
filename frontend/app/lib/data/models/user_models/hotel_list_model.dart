class HotelImageModel {
  final int id;
  final String relativePath;
  final String name;
  final String absolutePath;
  final String imageHttpLink;
  final String photoableType;
  final int photoableId;
  final DateTime createdAt;
  final DateTime updatedAt;

  HotelImageModel({
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

  factory HotelImageModel.fromJson(Map<String, dynamic> json) {
    return HotelImageModel(
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

class HotelListModel {
  final int id;
  final String name;
  final String location;
  final String phone;
  final int price;
  final int rating;
  final bool isFavorite;
  final HotelImageModel image;
  final String offer;

  HotelListModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.phone,
      required this.price,
      required this.rating,
      required this.image,
      required this.offer,
      required this.isFavorite});

  factory HotelListModel.fromJson(Map<String, dynamic> json) {
    return HotelListModel(
      id: json['hotel_id'],
      name: json['hotel_name'],
      location: json['hotel_location'],
      phone: json['hotel_phone'],
      price: json['hotel_price'],
      rating: json['final_rating'],
      isFavorite: json['isFavourite'] == 1,
      image: HotelImageModel.fromJson(json['image'][0]),
      offer: json['offer'][0],
    );
  }
}
