import 'package:app/data/web_service/user/flight_confirm_booking_web.dart';
import 'package:app/pages/User/cubits/flight_cubit/confirm_booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightReservationCubit extends Cubit<FlightReservationState> {
  final FlightReservationWeb flightReservationWeb;
  static FlightReservationCubit get(context) => BlocProvider.of(context);
  FlightReservationCubit(this.flightReservationWeb)
      : super(FlightReservationInitial());

  Future<void> cubitFlightReservation(int roomId) async {
    emit(FlightReservationLoading());
    try {
      await flightReservationWeb.fetchReservationFlight(roomId);

      emit(FlightReservationSuccess());
    } on Exception catch (e) {
      emit(FlightReservationFailure(e.toString()));
    }
  }
}
