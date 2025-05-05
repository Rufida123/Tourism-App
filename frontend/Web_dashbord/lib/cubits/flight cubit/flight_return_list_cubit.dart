import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:web_dashbord/assest/data%20and%20model/flight_return_list_model.dart';
import 'package:web_dashbord/cubits/flight%20cubit/flight_return_list_web.dart';

part 'flight_return_list_state.dart';

class FlightReturnListCubit extends Cubit<FlightReturnListState> {
  final FlightReturnListWeb flightReturnListWeb;

  static FlightReturnListCubit get(context) => BlocProvider.of(context);
  FlightReturnListModel? flights;
  FlightReturnListCubit(this.flightReturnListWeb)
      : super(FlightReturnListInitial());

  Future<void> cubitFlightReturnList() async {
    emit(FlightReturnListLoading());
    try {
      print('trying cubit');
      flights = await flightReturnListWeb.fetchFlightReturnList();

      emit(FlightReturnListSuccess());
    } on Exception catch (e) {
      emit(FlightReturnListFailure(e.toString()));
    }
  }
}
