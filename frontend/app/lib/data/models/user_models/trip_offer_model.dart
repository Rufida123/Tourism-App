class TripOfferModel {
  final String offerId;
  final String offerStatus;
  final String offerTitle;
  final String offerDescription;
  final DateTime offerStartDate;
  final DateTime offerEndDate;
  final String offerDiscountRate;

  TripOfferModel({
    required this.offerId,
    required this.offerStatus,
    required this.offerTitle,
    required this.offerDescription,
    required this.offerStartDate,
    required this.offerEndDate,
    required this.offerDiscountRate,
  });

  factory TripOfferModel.fromJson(Map<String, dynamic> json) {
    return TripOfferModel(
      offerId: json['offer_id'] as String,
      offerStatus: json['offer_status'] as String,
      offerTitle: json['offer_title'] as String,
      offerDescription: json['offer_description'] as String,
      offerStartDate: DateTime.parse(json['offer_start_date'] as String),
      offerEndDate: DateTime.parse(json['offer_end_date'] as String),
      offerDiscountRate: json['offer_discount_rate'] as String,
    );
  }
}
