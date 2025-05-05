class FlightOfferModel {
  int id;
  final String status;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String discountRate;

  FlightOfferModel({
    required this.id,
    required this.status,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.discountRate,
  });

  factory FlightOfferModel.fromJson(Map<String, dynamic> json) {
    return FlightOfferModel(
      id: json['id'] ,
      status: json['status'] ,
      title: json['title'] ,
      description: json['description'] ,
      startDate: DateTime.parse(json['start_date'] ),
      endDate: DateTime.parse(json['end_date'] ),
      discountRate: json['discount_rate'] ,
    );
  }
}
