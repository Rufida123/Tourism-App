import 'package:app/data/models/user_models/flight_booking_model.dart';
import 'package:app/data/web_service/user/flight_booking_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'booking_state.dart';

class BookingFlightCubit extends Cubit<BookingFlightState> {
  final BookingFlightWeb bookingFlightWeb;
  List<BookingFlightRequestModel> bookings = [];
  static BookingFlightCubit get(context) => BlocProvider.of(context);

  BookingFlightCubit(this.bookingFlightWeb) : super(BookingFlightInitial());
  int? bookingResponse;
  Future<void> cubitBookingFlight(
      String phoneNumber, int numOfChild, int numOfAdult, int id) async {
    emit(BookingFlightLoading());
    try {
      print('trying cubit');
      print(id);
      bookingResponse = await bookingFlightWeb.bookingFlight(
          phoneNumber, numOfChild, numOfAdult, id);

      emit(BookingFlightSuccess());
    } on Exception catch (e) {
      emit(BookingFlightFailure(e.toString()));
    }
  }
}
