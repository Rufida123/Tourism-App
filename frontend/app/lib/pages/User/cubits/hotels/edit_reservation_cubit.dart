import 'package:app/data/web_service/user/hotel_edit_reservation_web.dart';
import 'package:app/pages/User/cubits/hotels/edit_reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelEditReservationCubit extends Cubit<HotelEditReservationState> {
  final HotelEditReservationWeb hotelEditReservationWeb;

  static HotelEditReservationCubit get(context) => BlocProvider.of(context);
  HotelEditReservationCubit(this.hotelEditReservationWeb)
      : super(HotelEditReservationInitial());

  Future<void> cubitHotelEditReservation(
    String? reservationId,
    String? checkin,
    String? checkout,
    String? numberOFday,
    String? firstName,
    String? numberRoom,
  ) async {
    emit(HotelEditReservationLoading());
    try {
      await hotelEditReservationWeb.editReservationHotels(
          reservationId, checkin, checkout, numberOFday, firstName, numberRoom);

      emit(HotelEditReservationSuccess());
    } on Exception catch (e) {
      emit(HotelEditReservationFailure(e.toString()));
    }
  }
}
