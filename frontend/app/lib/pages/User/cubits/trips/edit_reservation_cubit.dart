import 'package:app/data/web_service/user/trip_edit_reservation_web.dart';
import 'package:app/pages/User/cubits/trips/edit_reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripEditReservationCubit extends Cubit<TripEditReservationState> {
  final TripEditReservationWeb tripEditReservationWeb;

  static TripEditReservationCubit get(context) => BlocProvider.of(context);
  TripEditReservationCubit(this.tripEditReservationWeb)
      : super(TripEditReservationInitial());

  Future<void> cubitTripEditReservation(
    String? reservationId,
    String? numberOfPeople,
    String? firstName,
    String? lastName,
    String? notes,
  ) async {
    emit(TripEditReservationLoading());
    try {
      await tripEditReservationWeb.editReservationTrip(
          reservationId, numberOfPeople, firstName, lastName, notes);

      emit(TripEditReservationSuccess());
    } on Exception catch (e) {
      emit(TripEditReservationFailure(e.toString()));
    }
  }
}