import 'package:app/data/web_service/user/trip_booking_web.dart';
import 'package:app/pages/User/cubits/trips/booking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripBookingCubit extends Cubit<TripBookingState> {
  final TripBookingWeb tripBookingWeb;
  static TripBookingCubit get(context) => BlocProvider.of(context);
  int? bookingResponse;
  TripBookingCubit(this.tripBookingWeb) : super(TripBookingInitial());

  Future<void> cubitTripBooking(String? firstName, String? lastName,
      String? numberOfPeople, String? notes, int tripId) async {
    emit(TripBookingLoading());
    try {
      print("trying booking cubit");
      bookingResponse = await tripBookingWeb.fetchBookingTrips(
          firstName, lastName, numberOfPeople, notes, tripId);

      emit(TripBookingSuccess());
    } on Exception catch (e) {
      emit(TripBookingFailure(e.toString()));
    }
  }
}
