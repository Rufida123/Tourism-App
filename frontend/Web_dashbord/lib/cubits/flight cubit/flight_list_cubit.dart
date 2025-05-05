import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_list_web.dart';

part 'flight_list_state.dart';

class FlightListCubit extends Cubit<FlightListState> {
  final FlightListWeb flightListWeb;

  static FlightListCubit get(context) => BlocProvider.of(context);
  List<dynamic> flights = [];
  FlightListCubit(this.flightListWeb) : super(FlightListInitial());

  Future<void> cubitFlightList() async {
    emit(FlightListLoading());
    try {
      print('trying cubit');
      flights = await flightListWeb.fetchFlightList();

      emit(FlightListSuccess());
    } on Exception catch (e) {
      emit(FlightListFailure(e.toString()));
    }
  }
}
