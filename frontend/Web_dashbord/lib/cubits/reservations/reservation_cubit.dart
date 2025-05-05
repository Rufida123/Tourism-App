import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/assest/data%20and%20model/reservations_flight_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/reservations_hotel_model.dart';
import 'package:web_dashbord/assest/data%20and%20model/reservations_trip_model.dart';
import 'package:web_dashbord/cubits/reservations/reservations_state.dart';
import 'package:web_dashbord/cubits/reservations/reservations_web.dart';

class ReservationFlightCubit extends Cubit<ReservationsState> {
  ReservationsFlightWeb reservationsFlightWeb;
  List<ReservationFlightModel> FRlist = [];
  static ReservationFlightCubit get(context) => BlocProvider.of(context);

  ReservationFlightCubit(this.reservationsFlightWeb)
      : super(ReservationFlightInitial());

  Future<void> cubitReservationFlightList() async {
    print('cubit');
    emit(ReservationFlightLoading());
    try {
      FRlist = await reservationsFlightWeb.fetchReservationFlighList();
      print(FRlist);
      emit(ReservationFlightSuccess());
    } on Exception catch (e) {
      emit(ReservationFlightFailure(e.toString()));
    }
  }
}

class ReservationHotelCubit extends Cubit<ReservationsState> {
  ReservationsHotelWeb reservationsHotelWeb;
  List<ReservationHotelModel> HRlist = [];
  static ReservationHotelCubit get(context) => BlocProvider.of(context);

  ReservationHotelCubit(this.reservationsHotelWeb)
      : super(ReservationFlightInitial());

  Future<void> cubitReservationHotelList() async {
    print('cubit');
    emit(ReservationHotelLoading());
    try {
      HRlist = await reservationsHotelWeb.fetchReservationHotelList();
      print(HRlist);
      emit(ReservationHotelSuccess());
    } on Exception catch (e) {
      emit(ReservationHotelFailure(e.toString()));
    }
  }
}

class ReservationTripCubit extends Cubit<ReservationsState> {
  ReservationsTripWeb reservationsTripWeb;
  List<ReservationTripModel> TRlist = [];
  static ReservationTripCubit get(context) => BlocProvider.of(context);

  ReservationTripCubit(this.reservationsTripWeb)
      : super(ReservationFlightInitial());

  Future<void> cubitReservationTripList() async {
    print('cubit');
    emit(ReservationTripLoading());
    try {
      TRlist = await reservationsTripWeb.fetchReservationTripList();
      print(TRlist);
      emit(ReservationTripSuccess());
    } on Exception catch (e) {
      emit(ReservationTripFailure(e.toString()));
    }
  }
}
