import 'package:app/data/models/user_models/flight_details_model.dart';
import 'package:app/data/web_service/user/flight_details_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'flight_details_state.dart';

class FlightDetailsCubit extends Cubit<FlightDetailsState> {
  final FlightDetailsWeb flightDetailsWeb;

  static FlightDetailsCubit get(context) => BlocProvider.of(context);
  FlightDetailsModel? flightdetails;
  FlightDetailsCubit(this.flightDetailsWeb) : super(FlightDetailsInitial());

  Future<void> cubitFlightDetails(int id) async {
    emit(FlightDetailsLoading());
    try {
      print('trying cubit');
      flightdetails = await flightDetailsWeb.fetchFlightDetails(id);

      emit(FlightDetailsSuccess());
    } on Exception catch (e) {
      emit(FlightDetailsFailure(e.toString()));
    }
  }
}
