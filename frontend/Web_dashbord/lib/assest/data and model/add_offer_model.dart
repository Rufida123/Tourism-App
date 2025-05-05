class OfferAddModel {
  final String status;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String discountRate;
  final String discountValue;
  final String offerableType;
  final String offerableId;

  OfferAddModel(
      {required this.status,
      required this.startDate,
      required this.endDate,
      required this.description,
      required this.title,
      required this.discountRate,
      required this.discountValue,
      required this.offerableId,
      required this.offerableType});
  Map<String, String> toJson() {
    return {
      'status': status,
      'title': title,
      'description': description,
      'start_date': startDate,
      'end_date': endDate,
      'discount_rate': discountRate,
      'discount_value': discountValue,
      'offerable_type': offerableType,
      'offerable_id': offerableId
      // No need to convert to String here, as the type is dynamic
    };
  }
}
