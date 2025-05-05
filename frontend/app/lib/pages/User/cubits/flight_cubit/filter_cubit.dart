import 'package:app/data/models/user_models/filter_flight_model.dart';
import 'package:app/data/web_service/user/filter_flight_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterFlightCubit extends Cubit<FilterFlightState> {
  final FilterFlightWeb filterFlightWeb;

  static FilterFlightCubit get(context) => BlocProvider.of(context);
  List<FlightFilterModel> flights = [];
  FilterFlightCubit(this.filterFlightWeb) : super(FilterFlightInitial());

  Future<void> cubitFilterFlight(
      String departureDateStart,
      String departureDateEnd,
      String minPrice,
      String maxPrice,
      String airlineName) async {
    emit(FilterFlightLoading());
    try {
      print('trying cubit');
      flights = await filterFlightWeb.filterFlight(departureDateStart,
          departureDateEnd, minPrice, maxPrice, airlineName);
      emit(FilterFlightSuccess());
    } on Exception catch (e) {
      emit(FilterFlightFailure(e.toString()));
    }
  }
}
