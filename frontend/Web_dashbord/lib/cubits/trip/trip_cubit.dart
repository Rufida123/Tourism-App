import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/trip/trip_web.dart';
import 'package:web_dashbord/assest/data%20and%20model/trip_model.dart';

part 'trip_state.dart';

class TripListCubit extends Cubit<TripListState> {
  TripListWeb tripListWeb;
  List<TripListModel> list = [];
  static TripListCubit get(context) => BlocProvider.of(context);

  TripListCubit(this.tripListWeb) : super(TripListInitial());

  Future<void> cubitTripList() async {
    print('cubit');
    emit(TripListLoading());
    try {
      list = await tripListWeb.fetchTripList();
      print(list);
      emit(TripListSuccess());
    } on Exception catch (e) {
      emit(TripListFailure(e.toString()));
    }
  }
}
