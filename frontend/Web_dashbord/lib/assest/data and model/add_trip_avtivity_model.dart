class AddTripActivityDetailsModel {
  final String? name;

  AddTripActivityDetailsModel(
    this.name,
  );
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
