class TripImageModel {
  final int id;
  final String relativePath;
  final String name;
  final String absolutePath;
  final String imageHttpLink;
  final String photoableType;
  final int photoableId;
  final DateTime createdAt;
  final DateTime updatedAt;

  TripImageModel({
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

  factory TripImageModel.fromJson(Map<String, dynamic> json) {
    return TripImageModel(
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

class TripListModel {
  final int id;
  final String name;
  final String location;
  final String phone;
  final String price;
  final String tripType;
  final int rating;
  final bool isFavorite;
  final TripImageModel image;
  final String offer;
  final String detailId;

  TripListModel(
      {required this.id,
      required this.name,
      required this.location,
      required this.phone,
      required this.price,
      required this.tripType,
      required this.rating,
      required this.image,
      required this.offer,
      required this.isFavorite,
      required this.detailId});

  factory TripListModel.fromJson(Map<String, dynamic> json) {
    return TripListModel(
        id: json['trip_id'],
        name: json['trip_name'],
        location: json['trip_location'],
        phone: json['trip_phone'],
        price: json['trip_price'],
        tripType: json['tripType'],
        rating: json['final_rating'],
        isFavorite: json['isFavourite'] == 1,
        image: json['image'] != null
            ? TripImageModel.fromJson(json['image'])
            : TripImageModel(
                id: 0,
                relativePath: '',
                name: '',
                absolutePath: '',
                imageHttpLink: '',
                photoableType: '',
                photoableId: 0,
                createdAt: DateTime.now(),
                updatedAt: DateTime.now(),
              ),
        offer: json['offer'][0],
        detailId: json['detail_trip_id']);
  }
}
