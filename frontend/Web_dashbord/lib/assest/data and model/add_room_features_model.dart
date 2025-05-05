class AddRoomFeaturesModel {
  final String? name;

  AddRoomFeaturesModel(
    this.name,
  );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
