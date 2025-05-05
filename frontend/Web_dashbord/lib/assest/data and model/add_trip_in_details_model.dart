class AddTripInDetailsModel {
  final String? name;
  final String? location;
  final String? maximumParticipants;
  final String? startDate;
  final String? endDate;
  final String? descriptionDetailtrip;
  final String? startAgeFormDetailtrip;
  final String? durationDetailtrip;

  AddTripInDetailsModel(
      this.name,
      this.location,
      this.maximumParticipants,
      this.startDate,
      this.endDate,
      this.descriptionDetailtrip,
      this.startAgeFormDetailtrip,
      this.durationDetailtrip);
  Map<String, dynamic> toJson() {
    return {
      'name_detailtrip': name,
      'location_detailtrip': location,
      'description_detailtrip': descriptionDetailtrip,
      'startDate_detailtrip': startDate,
      'endDate_detailtrip': endDate,
      'MaximumParticipants_detailtrip': maximumParticipants,
      'Duration_detailtrip': durationDetailtrip,
      'startAgeForm_detailtrip': startAgeFormDetailtrip,
    };
  }
}
