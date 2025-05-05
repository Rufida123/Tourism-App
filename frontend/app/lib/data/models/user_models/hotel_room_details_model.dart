class RoomDetailsModel {
  final int id;
  final int price;
  final int capacity;
  final String description;
  final List<RoomPhoto> photoUrls;
  final List<RoomTypes> roomType;
  final List<RoomFeature> features;

  RoomDetailsModel({
    required this.id,
    required this.price,
    required this.capacity,
    required this.description,
    required this.photoUrls,
    required this.roomType,
    required this.features,
  });

  factory RoomDetailsModel.fromJson(Map<String, dynamic> json) {
    var photosList = (json['photo'] as List?)
            ?.map((photoJson) => RoomPhoto.fromJson(photoJson))
            .toList() ??
        [];
    var roomTypesList = (json['room_type'] as List?)
            ?.map((typeJson) => RoomTypes.fromJson(typeJson))
            .toList() ??
        [];
    var featuresList = (json['features'] as List?)
            ?.map((featureJson) => RoomFeature.fromJson(featureJson))
            .toList() ??
        [];

    return RoomDetailsModel(
      id: json['id'],
      price: json['Price'],
      capacity: json['capacity'],
      description: json['description'],
      photoUrls: photosList,
      roomType: roomTypesList,
      features: featuresList,
    );
  }
  List<String> get relativePhotoPaths {
    return photoUrls.map((photo) => photo.relativePath).toList();
  }

  List<String> get roomFeatures {
    return features.map((feature) => feature.name).toList();
  }

  List<String> get roomTypes {
    return roomType.map((type) => type.name).toList();
  }
}

class RoomPhoto {
  final int id;
  final String relativePath;
  final String name;
  final String absolutePath;
  final String imageHttpLink;

  RoomPhoto({
    required this.id,
    required this.relativePath,
    required this.name,
    required this.absolutePath,
    required this.imageHttpLink,
  });

  factory RoomPhoto.fromJson(Map<String, dynamic> json) {
    return RoomPhoto(
      id: json['id'],
      relativePath: json['RelativePath'],
      name: json['name'],
      absolutePath: json['AbsolutePath'],
      imageHttpLink: json['ImageHttpLink'],
    );
  }
}

class RoomFeature {
  final String name;

  RoomFeature({required this.name});

  factory RoomFeature.fromJson(Map<String, dynamic> json) {
    return RoomFeature(name: json['name'] as String);
  }
}

class RoomTypes {
  final String name;

  RoomTypes({required this.name});

  factory RoomTypes.fromJson(Map<String, dynamic> json) {
    return RoomTypes(name: json['name'] as String);
  }
}
