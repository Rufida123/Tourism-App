class EditRoomFeaturesModel {
  final String? name;

  EditRoomFeaturesModel(
    this.name,
  );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
