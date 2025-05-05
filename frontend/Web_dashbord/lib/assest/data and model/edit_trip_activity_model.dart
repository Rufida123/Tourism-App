class EditTripActivityDetailsModel {
  final String? name;

  EditTripActivityDetailsModel(
    this.name,
  );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
