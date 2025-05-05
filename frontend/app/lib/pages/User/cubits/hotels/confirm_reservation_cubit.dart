import 'package:app/data/web_service/user/hotel_confirm_reservation_web.dart';
import 'package:app/pages/User/cubits/hotels/confirm_reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelReservationCubit extends Cubit<HotelReservationState> {
  final HotelReservationWeb hotelReservationWeb;
  static HotelReservationCubit get(context) => BlocProvider.of(context);
  HotelReservationCubit(this.hotelReservationWeb)
      : super(HotelReservationInitial());

  Future<void> cubitHotelReservation(int roomId) async {
    emit(HotelReservationLoading());
    try {
      await hotelReservationWeb.fetchReservationHotels(roomId);

      emit(HotelReservationSuccess());
    } on Exception catch (e) {
      emit(HotelReservationFailure(e.toString()));
    }
  }
}
