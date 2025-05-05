import 'package:app/data/models/user_models/hotel_search_model.dart';
import 'package:app/data/web_service/user/hote_search_web.dart';
import 'package:app/pages/User/cubits/hotels/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelSearchFillterCubit extends Cubit<HotelSearchFillterState> {
  final HotelSearchFillterWeb hotelSearchFillterWeb;

  static HotelSearchFillterCubit get(context) => BlocProvider.of(context);
  List<HotelSearchFillterModel> hotels = [];
  HotelSearchFillterCubit(this.hotelSearchFillterWeb)
      : super(HotelSearchFillterInitial());

  Future<void> cubitHotelSearchFillter(
      final name,
      final location,
      final roomType,
      final checkin,
      final checkout,
      final rating,
      final feature) async {
    emit(HotelSearchFillterLoading());
    try {
      hotels = await hotelSearchFillterWeb.fetchSearchAndFilterHotels(
          name, location, roomType, checkin, checkout, rating, feature);

      emit(HotelSearchFillterSuccess());
    } on Exception catch (e) {
      emit(HotelSearchFillterFailure(e.toString()));
    }
  }
}
