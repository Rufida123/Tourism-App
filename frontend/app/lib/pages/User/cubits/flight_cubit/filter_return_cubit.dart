import 'package:app/data/models/user_models/filter_flight_return_model.dart';
import 'package:app/data/web_service/user/filter_return_flight_web.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'filter_return_state.dart';

class FilterReturnFlightCubit extends Cubit<FilterReturnFlightState> {
  final FilterReturnFlightWeb filterReturnFlightWeb;

  static FilterReturnFlightCubit get(context) => BlocProvider.of(context);
  List<FlightFilterReturnModel> flights = [];
  FilterReturnFlightCubit(this.filterReturnFlightWeb)
      : super(FilterReturnFlightInitial());

  Future<void> cubitFilterReturnFlight(
      String departureDateStart,
      String departureDateEnd,
      String minPrice,
      String maxPrice,
      String airlineName) async {
    emit(FilterReturnFlightLoading());
    try {
      print('trying cubit');
      flights = await filterReturnFlightWeb.filterReturnFlight(
          departureDateStart,
          departureDateEnd,
          minPrice,
          maxPrice,
          airlineName);
      emit(FilterReturnFlightSuccess());
    } on Exception catch (e) {
      emit(FilterReturnFlightFailure(e.toString()));
    }
  }
}
