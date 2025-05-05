import 'package:app/data/web_service/user/trip_confirm_reservation_web.dart';
import 'package:app/pages/User/cubits/trips/confirm_reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripReservationCubit extends Cubit<TripReservationState> {
  final TripReservationWeb tripReservationWeb;
  static TripReservationCubit get(context) => BlocProvider.of(context);
  TripReservationCubit(this.tripReservationWeb)
      : super(TripReservationInitial());

  Future<void> cubitTripReservation(int tripId) async {
    emit(TripReservationLoading());
    try {
      await tripReservationWeb.fetchReservationTrip(tripId);

      emit(TripReservationSuccess());
    } on Exception catch (e) {
      emit(TripReservationFailure(e.toString()));
    }
  }
}
