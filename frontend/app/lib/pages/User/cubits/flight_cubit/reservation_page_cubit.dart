import 'package:app/data/models/user_models/flight_reservation_page.dart';
import 'package:app/data/web_service/user/flight_cancel_reservation_web.dart';
import 'package:app/data/web_service/user/flight_reservation_page_web.dart';
import 'package:app/pages/User/cubits/flight_cubit/reservation_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightReservationPageCubit extends Cubit<FlightReservationPageState> {
  final FlightReservationPageWeb flightReservationPageWeb;

  static FlightReservationPageCubit get(context) => BlocProvider.of(context);
  List<FlightReservationPageModel> reservations = [];
  FlightReservationPageCubit(this.flightReservationPageWeb)
      : super(FlightReservationPageInitial());

  Future<void> cubitFlightReservationPage() async {
    emit(FlightReservationPageLoading());
    try {
      reservations =
          await flightReservationPageWeb.fetchFlightReservationPage();

      emit(FlightReservationPageSuccess());
    } on Exception catch (e) {
      emit(FlightReservationPageFailure(e.toString()));
    }
  }
}

class FlightCancelReservationCubit extends Cubit<FlightReservationPageState> {
  final FlightCancelReservationWeb flightCancelReservationWeb;

  static FlightCancelReservationCubit get(context) => BlocProvider.of(context);
  FlightCancelReservationCubit(this.flightCancelReservationWeb)
      : super(FlightCancelReservationInitial());

  Future<void> cubitFlightCancelReservation(int resId) async {
    emit(FlightCancelReservationLoading());
    try {
      await flightCancelReservationWeb.CancelReservationFlight(resId);

      emit(FlightCancelReservationSuccess());
    } on Exception catch (e) {
      emit(FlightCancelReservationFailure(e.toString()));
    }
  }
}
