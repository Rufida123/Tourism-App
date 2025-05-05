class EditRoomModel {
  final String? capacity;
  final String? price;
  final String? description;

  EditRoomModel(this.capacity, this.price, this.description);
  Map<String, dynamic> toJson() {
    return {
      'capacity': capacity,
      'price': price,
      'description': description,
    };
  }
}
