import 'package:app/data/models/user_models/hotel_reservation_page_model.dart';
import 'package:app/data/web_service/user/hotel_cancel_reservation_web.dart';
import 'package:app/data/web_service/user/hotel_reservation_page_web.dart';
import 'package:app/pages/User/cubits/hotels/reservation_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelReservationPageCubit extends Cubit<HotelReservationPageState> {
  final HotelReservationPageWeb hotelReservationPageWeb;

  static HotelReservationPageCubit get(context) => BlocProvider.of(context);
  List<HotelReservationPageModel> reservations = [];
  HotelReservationPageCubit(this.hotelReservationPageWeb)
      : super(HotelReservationPageInitial());

  Future<void> cubitHotelReservationPage() async {
    emit(HotelReservationPageLoading());
    try {
      reservations = await hotelReservationPageWeb.fetchHotelReservationPage();

      emit(HotelReservationPageSuccess());
    } on Exception catch (e) {
      emit(HotelReservationPageFailure(e.toString()));
    }
  }
}

class HotelCancelReservationCubit extends Cubit<HotelReservationPageState> {
  final HotelCancelReservationWeb hotelCancelReservationWeb;

  static HotelCancelReservationCubit get(context) => BlocProvider.of(context);
  HotelCancelReservationCubit(this.hotelCancelReservationWeb)
      : super(HotelCancelReservationInitial());

  Future<void> cubitHotelCancelReservation(int resId) async {
    emit(HotelCancelReservationLoading());
    try {
      await hotelCancelReservationWeb.CancelReservationHotels(resId);

      emit(HotelCancelReservationSuccess());
    } on Exception catch (e) {
      emit(HotelCancelReservationFailure(e.toString()));
    }
  }
}
