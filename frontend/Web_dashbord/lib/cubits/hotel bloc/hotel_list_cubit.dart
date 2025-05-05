import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:web_dashbord/assest/data%20and%20model/hotel_model.dart';
import 'package:web_dashbord/cubits/hotel%20bloc/hotel_list_web.dart';

part 'hotel_list_state.dart';

class HotelListCubit extends Cubit<HotelListState> {
  final HotelListWeb hotelListWeb;

  static HotelListCubit get(context) => BlocProvider.of(context);
  List<HotelListModel> hotels = [];
  HotelListCubit(this.hotelListWeb) : super(HotelListInitial());

  Future<void> cubitHotelList() async {
    emit(HotelListLoading());
    try {
      hotels = await hotelListWeb.fetchHotelList();

      emit(HotelListSuccess());
    } on Exception catch (e) {
      emit(HotelListFailure(e.toString()));
    }
  }
}
