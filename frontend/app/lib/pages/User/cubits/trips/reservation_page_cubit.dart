import 'package:app/data/models/user_models/trip_reservation_page_model.dart';
import 'package:app/data/web_service/user/trip_cancel_reservation_web.dart';
import 'package:app/data/web_service/user/trip_reservation_page_web.dart';
import 'package:app/pages/User/cubits/trips/reservation_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripReservationPageCubit extends Cubit<TripReservationPageState> {
  final TripReservationPageWeb tripReservationPageWeb;

  static TripReservationPageCubit get(context) => BlocProvider.of(context);
  List<TripReservationPageModel> Treservations = [];
  TripReservationPageCubit(this.tripReservationPageWeb)
      : super(TripReservationPageInitial());

  Future<void> cubitTripReservationPage() async {
    emit(TripReservationPageLoading());
    try {
      Treservations = await tripReservationPageWeb.fetchTripReservationPage();

      emit(TripReservationPageSuccess());
    } on Exception catch (e) {
      emit(TripReservationPageFailure(e.toString()));
    }
  }
}

class TripCancelReservationCubit extends Cubit<TripReservationPageState> {
  final TripCancelReservationWeb tripCancelReservationWeb;

  static TripCancelReservationCubit get(context) => BlocProvider.of(context);
  TripCancelReservationCubit(this.tripCancelReservationWeb)
      : super(TripCancelReservationInitial());

  Future<void> cubitHotelCancelReservation(int resId) async {
    emit(TripCancelReservationLoading());
    try {
      await tripCancelReservationWeb.CancelReservationTrip(resId);

      emit(TripCancelReservationSuccess());
    } on Exception catch (e) {
      emit(TripCancelReservationFailure(e.toString()));
    }
  }
}
