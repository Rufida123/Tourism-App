class EditRoomTypeModel {
  final String? name;

  EditRoomTypeModel(
    this.name,
  );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
