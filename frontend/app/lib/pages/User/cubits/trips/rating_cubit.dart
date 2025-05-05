import 'package:app/data/web_service/user/trip_rating_web.dart';
import 'package:app/pages/User/cubits/trips/rating_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripRatingCubit extends Cubit<TripRatingState> {
  final TripRatingWeb tripRatingWeb;
  var myRating;
  static TripRatingCubit get(context) => BlocProvider.of(context);
  TripRatingCubit(this.tripRatingWeb) : super(TripRatingInitial());
  Future<void> cubitTripRating(int tripId, int rating) async {
    emit(TripRatingLoading());
    try {
      myRating = await tripRatingWeb.sendTripRating(tripId, rating);

      emit(TripRatingSuccess());
    } catch (e) {
      emit(TripRatingFailure(e.toString()));
    }
  }
}
