import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Flight%20Services/edit_flight_state.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Flight%20Services/edit_flight_web.dart';

class EditFlightCubit extends Cubit<EditFlightState> {
  final EditFlightWeb addFlightWeb;
  static EditFlightCubit get(context) => BlocProvider.of(context);
  EditFlightCubit(this.addFlightWeb) : super(EditFlightInitial());

  Future<void> cubitAddFlight(
      final String? departureAirport,
      final String? arrivalAirport,
      final String? companyName,
      final String? departureDate,
      final String? arrivalDate,
      final String? departureTime,
      final String? arrivalTime,
      final String? typeTrip,
      final String? priceOfTicket,
      final String? passengerCount,
      final String? departureReturnId,
      String flightId) async {
    emit(EditFlightLoading());
    try {
      print("trying booking cubit");
      await addFlightWeb.fetchEditFlight(
          departureAirport,
          arrivalAirport,
          companyName,
          departureDate,
          arrivalDate,
          departureTime,
          arrivalTime,
          typeTrip,
          priceOfTicket,
          passengerCount,
          departureReturnId,
          flightId);

      emit(EditFlightSuccess());
    } on Exception catch (e) {
      emit(EditFlightFailure(e.toString()));
    }
  }
}
