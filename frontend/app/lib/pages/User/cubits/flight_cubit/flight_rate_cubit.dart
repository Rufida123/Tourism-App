import 'package:app/data/web_service/user/flight_rating_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'flight_rate_state.dart';

class FlightRatingCubit extends Cubit<FlightRatingState> {
  final FlightRatingWeb flightRatingWeb;
  var myRating;
  static FlightRatingCubit get(context) => BlocProvider.of(context);
  FlightRatingCubit(this.flightRatingWeb) : super(FlightRatingInitial());
  Future<void> cubitFlightRating(int id, int rating) async {
    emit(FlightRatingLoading());
    try {
      myRating = await flightRatingWeb.sendFlightRating(id, rating);

      emit(FlightRatingSuccess());
    } catch (e) {
      emit(FlightRatingFailure(e.toString()));
    }
  }
}
