class AddRoomTypeModel {
  final String? name;

  AddRoomTypeModel(
    this.name,
  );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
