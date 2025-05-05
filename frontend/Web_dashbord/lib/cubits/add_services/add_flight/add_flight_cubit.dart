import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/add_services/add_flight/add_fight_web.dart';
import 'package:web_dashbord/cubits/add_services/add_flight/add_flight_state.dart';

class AddFlightCubit extends Cubit<AddFlightState> {
  final AddFlightWeb addFlightWeb;
  static AddFlightCubit get(context) => BlocProvider.of(context);
  AddFlightCubit(this.addFlightWeb) : super(AddFlightInitial());

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
  ) async {
    emit(AddFlightLoading());
    try {
      print("trying booking cubit");
      await addFlightWeb.fetchAddFlight(
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
      );

      emit(AddFlightSuccess());
    } on Exception catch (e) {
      emit(AddFlightFailure(e.toString()));
    }
  }
}
