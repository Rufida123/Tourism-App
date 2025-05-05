

class BookingFlightRequestModel{
  final String phoneNumber;
final int numOfChild;
final int numOfAdult;



BookingFlightRequestModel( {required this.phoneNumber,required this.numOfChild,required this.numOfAdult});
Map<String, dynamic> toJson() {
    return {
      'phone': phoneNumber,
      'num_of_child':numOfChild,
      'num_of_adult':numOfAdult,
    

    };
  }
}