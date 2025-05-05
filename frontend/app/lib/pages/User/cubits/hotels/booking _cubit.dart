import 'package:app/data/web_service/user/hotel_booking_web.dart';
import 'package:app/pages/User/cubits/hotels/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelBookingCubit extends Cubit<HotelBookingState> {
  final HotelBookingWeb hotelBookingWeb;
  static HotelBookingCubit get(context) => BlocProvider.of(context);
  int? bookingResponse;
  HotelBookingCubit(this.hotelBookingWeb) : super(HotelBookingInitial());

  Future<void> cubitHotelBooking(
      final String? checkin,
      String? checkout,
      String? numberOFday,
      String? firstName,
      String? numberroom,
      int roomId) async {
    emit(HotelBookingLoading());
    try {
      print("trying booking cubit");
      bookingResponse = await hotelBookingWeb.fetchBookingHotels(
          checkin, checkout, numberOFday, firstName, numberroom, roomId);

      emit(HotelBookingSuccess());
    } on Exception catch (e) {
      emit(HotelBookingFailure(e.toString()));
    }
  }
}
