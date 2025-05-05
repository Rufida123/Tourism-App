class OfferList {
  final int id;
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final String discountValue;

  OfferList({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.discountValue,
  });

  factory OfferList.fromJson(Map<String, dynamic> json) {
    return OfferList(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      discountValue: json['discount_rate'] as String,
    );
  }

}