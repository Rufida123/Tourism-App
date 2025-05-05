import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/offer_list/add_offer_state.dart';
import 'package:web_dashbord/cubits/offer_list/add_offer_web.dart';

class AddOfferCubit extends Cubit<AddOfferState> {
  final AddOfferWeb addOfferWeb;

  static AddOfferCubit get(context) => BlocProvider.of(context);

  AddOfferCubit(this.addOfferWeb) : super(AddOfferInitial());

  Future<void> cubitAddOffer(
      String status,
      String title,
      String description,
      String startDate,
      String endDate,
      String discountRate,
      String discountValue,
      String offerableType,
      String offerableId) async {
    emit(AddOfferLoading());
    try {
      print('trying cubit');
      await addOfferWeb.addOffer(status, title, description, startDate, endDate,
          discountRate, discountValue, offerableType, offerableId);
      emit(AddOfferSuccess());
    } on Exception catch (e) {
      emit(AddOfferFailure(e.toString()));
    }
  }
}
