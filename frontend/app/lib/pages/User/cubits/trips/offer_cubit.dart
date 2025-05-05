import 'package:app/data/web_service/user/trip_offer_web.dart';
import 'package:app/pages/User/cubits/trips/offer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripOfferCubit extends Cubit<TripOfferState> {
  final TripOfferWeb tripOfferWeb;
  var offer;
  static TripOfferCubit get(context) => BlocProvider.of(context);
  TripOfferCubit(this.tripOfferWeb) : super(TripOfferInitial());
  Future<void> cubitTripOffer(int tripId) async {
    emit(TripOfferLoading());
    try {
      print('trying offer cubit');
      offer = await tripOfferWeb.fetchTripOffer(tripId);

      emit(TripOfferSuccess());
    } catch (e) {
      emit(TripOfferFailure(e.toString()));
    }
  }
}
