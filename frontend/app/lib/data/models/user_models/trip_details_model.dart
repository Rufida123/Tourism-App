class TripDetailsModel {
  final String tripName;
  final String tripLocation;
  final String descriptionTrip;
  final String startDateTrip;
  final String endDateTrip;
  final String maximumParticipantsTrip;
  final String durationTrip;
  final String startAgeFormTrip;
  final List<TripPhoto> tripPhoto;
  final List<Activities> activities;

  TripDetailsModel(
      {required this.tripName,
      required this.tripLocation,
      required this.descriptionTrip,
      required this.startDateTrip,
      required this.endDateTrip,
      required this.maximumParticipantsTrip,
      required this.durationTrip,
      required this.startAgeFormTrip,
      required this.tripPhoto,
      required this.activities});

  factory TripDetailsModel.fromJson(Map<String, dynamic> json) {
    return TripDetailsModel(
      tripName: json['hotel_name'],
      tripLocation: json['hotel_location'],
      descriptionTrip: json['description_trip'],
      startDateTrip: json['startDate_trip'],
      endDateTrip: json['endDate_trip'],
      maximumParticipantsTrip: json['MaximumParticipants_trip'],
      durationTrip: json['Duration_trip'],
      startAgeFormTrip: json['startAgeForm_trip'],
      tripPhoto: json['hotel_photo'] != null
          ? List<TripPhoto>.from(
              json['hotel_photo'].map((v) => TripPhoto.fromJson(v)))
          : [],
      activities: json['activities'] != null
          ? List<Activities>.from(
              json['activities'].map((v) => Activities.fromJson(v)))
          : [],
    );
  }
  List<String> get relativePhotoPaths {
    return tripPhoto.map((photo) => photo.relativePath).toList();
  }

  List<String> get activity {
    return activities.map((activity) => activity.activityName).toList();
  }
}

class TripPhoto {
  int id;
  String relativePath;
  String name;
  String absolutePath;
  String imageHttpLink;
  String photoableType;
  int photoableId;
  String createdAt;
  String updatedAt;

  TripPhoto(
      {required this.id,
      required this.relativePath,
      required this.name,
      required this.absolutePath,
      required this.imageHttpLink,
      required this.photoableType,
      required this.photoableId,
      required this.createdAt,
      required this.updatedAt});

  factory TripPhoto.fromJson(Map<String, dynamic> json) {
    return TripPhoto(
      id: json['id'],
      relativePath: json['RelativePath'] ?? '', // Handle null value
      name: json['name'],
      absolutePath: json['absolutePath'] ?? '', // Handle null value
      imageHttpLink: json['imageHttpLink'] ?? '', // Handle null value
      photoableType: json['photoable_type'],
      photoableId: json['photoable_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Activities {
  String activityName;

  Activities({required this.activityName});

  factory Activities.fromJson(Map<String, dynamic> json) {
    return Activities(activityName: json['activity_name'] ?? '');
  }
}
