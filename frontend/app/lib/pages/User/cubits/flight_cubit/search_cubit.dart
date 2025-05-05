import 'package:app/data/models/user_models/search_flight_model.dart';
import 'package:app/data/web_service/user/search_flight_web.dart';
import 'package:app/pages/User/cubits/flight_cubit/search_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFlightCubit extends Cubit<SearchFlightState> {
  final SearchFlightWeb searchFlightWeb;

  static SearchFlightCubit get(context) => BlocProvider.of(context);
  List<FlightSearchModel> flightsearch = [];
  SearchFlightCubit(this.searchFlightWeb) : super(SearchFlightInitial());

  Future<void> cubitFlightSearch(String searchQuery) async {
    emit(SearchFlightLoading());
    try {
      print('trying cubit');
      flightsearch = await searchFlightWeb.searchFlight(searchQuery);
      emit(SearchFlightSuccess());
    } on Exception catch (e) {
      emit(SearchFlightFailure(e.toString()));
    }
  }
}
