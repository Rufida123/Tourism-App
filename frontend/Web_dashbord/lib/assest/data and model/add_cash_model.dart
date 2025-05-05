class AddUserCashModel {
  final String? userId;
  final String? cash;


  AddUserCashModel(
    this.userId,
    this.cash,
  );
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'cash': cash,
    };
  }
}