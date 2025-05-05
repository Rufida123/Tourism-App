import 'package:app/data/web_service/user/hotel_rating_web.dart';
import 'package:app/pages/User/cubits/hotels/rating_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelRatingCubit extends Cubit<HotelRatingState> {
  final HotelRatingWeb hotelRatingWeb;
  var myRating;
  static HotelRatingCubit get(context) => BlocProvider.of(context);
  HotelRatingCubit(this.hotelRatingWeb) : super(HotelRatingInitial());
  Future<void> cubitHotelRating(int roomId, int rating) async {
    emit(HotelRatingLoading());
    try {
      myRating = await hotelRatingWeb.sendHotelRating(roomId, rating);

      emit(HotelRatingSuccess());
    } catch (e) {
      emit(HotelRatingFailure(e.toString()));
    }
  }
}
