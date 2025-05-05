import 'package:app/data/web_service/user/hote_offer_web.dart';
import 'package:app/pages/User/cubits/hotels/offer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelOfferCubit extends Cubit<HotelOfferState> {
  final HotelOfferWeb hotelOfferWeb;
  var offer;
  static HotelOfferCubit get(context) => BlocProvider.of(context);
  HotelOfferCubit(this.hotelOfferWeb) : super(HotelOfferInitial());
  Future<void> cubitHotelOffer(int roomId) async {
    emit(HotelOfferLoading());
    try {
      print('trying offer cubit');
      offer = await hotelOfferWeb.fetchHotelOffer(roomId);

      emit(HotelOfferSuccess());
    } catch (e) {
      emit(HotelOfferFailure(e.toString()));
    }
  }
}
