import 'package:app/data/models/user_models/flight_offer_model.dart';
import 'package:app/data/web_service/user/flight_offer_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'flight_offer_state.dart';

class FlightOfferCubit extends Cubit<FlightOfferState> {
  final FlightOfferWeb flightOfferWeb;
  List<FlightOfferModel> offer = [];
  static FlightOfferCubit get(context) => BlocProvider.of(context);
  FlightOfferCubit(this.flightOfferWeb) : super(FlightOfferInitial());
  Future<void> cubitFlightOffer(int flightId) async {
    emit(FlightOfferLoading());
    try {
      print('trying offer cubit');
      await flightOfferWeb.fetchFlightOffer(flightId);

      emit(FlightOfferSuccess());
    } catch (e) {
      emit(FlightOfferFailure(e.toString()));
    }
  }
}
