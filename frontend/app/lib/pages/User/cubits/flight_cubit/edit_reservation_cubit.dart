import 'package:app/data/web_service/user/flight_edit_reservation_web.dart';
import 'package:app/pages/User/cubits/flight_cubit/edit_reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightEditReservationCubit extends Cubit<FlightEditReservationState> {
  final FlightEditReservationWeb hotelEditReservationWeb;

  static FlightEditReservationCubit get(context) => BlocProvider.of(context);
  FlightEditReservationCubit(this.hotelEditReservationWeb)
      : super(FlightEditReservationInitial());

  Future<void> cubitFlightEditReservation(String? NumberOfAdults,
      String? NumberOfChildren, String? phone, int id) async {
    emit(FlightEditReservationLoading());
    try {
      await hotelEditReservationWeb.editReservationFlight(
          NumberOfAdults, NumberOfChildren, phone, id);

      emit(FlightEditReservationSuccess());
    } on Exception catch (e) {
      emit(FlightEditReservationFailure(e.toString()));
    }
  }
}
