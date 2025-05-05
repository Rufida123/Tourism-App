import 'package:app/data/web_service/user/trip_details_web.dart';
import 'package:app/pages/User/cubits/trips/trip_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripDetailsCubit extends Cubit<TripDetailsState> {
  final TripDetailsWeb tripDetailsWeb;
  var trip;
  static TripDetailsCubit get(context) => BlocProvider.of(context);
  TripDetailsCubit(this.tripDetailsWeb) : super(TripDetailsInitial());
  Future<void> cubitTripIdDetails(int tripId) async {
    emit(TripDetailsLoading());
    try {
      print('trying trip cubit');
      trip = await tripDetailsWeb.fetchTripDetails(tripId);

      emit(TripDetailsSuccess());
    } catch (e) {
      emit(TripDetailsFailure(e.toString()));
    }
  }
}
