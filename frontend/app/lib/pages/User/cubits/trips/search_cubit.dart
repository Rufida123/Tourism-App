import 'package:app/data/models/user_models/trip_search_model.dart';
import 'package:app/data/web_service/user/trip_search_web%20.dart';
import 'package:app/pages/User/cubits/trips/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripSearchFillterCubit extends Cubit<TripSearchFillterState> {
  final TripSearchFillterWeb tripSearchFillterWeb;

  static TripSearchFillterCubit get(context) => BlocProvider.of(context);
  List<TripSearchFilterModel> trips = [];
  TripSearchFillterCubit(this.tripSearchFillterWeb)
      : super(TripSearchFillterInitial());

  Future<void> cubitTripSearchFillter(
    final name,
    final location,
    final roomType,
    final checkin,
    final checkout,
    final rating,
  ) async {
    emit(TripSearchFillterLoading());
    try {
      trips = await tripSearchFillterWeb.fetchSearchAndFilterTrips(
          name, location, roomType, checkin, checkout, rating);

      emit(TripSearchFillterSuccess());
    } on Exception catch (e) {
      emit(TripSearchFillterFailure(e.toString()));
    }
  }
}
