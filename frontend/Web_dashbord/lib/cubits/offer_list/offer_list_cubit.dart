import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:web_dashbord/assest/data%20and%20model/offer_list_model.dart';
import 'package:web_dashbord/cubits/offer_list/offer_list_web.dart';

part 'offer_list_state.dart';

class OfferListCubit extends Cubit<OfferListState> {
  final OfferListWeb offerListWeb;

  static OfferListCubit get(context) => BlocProvider.of(context);
  List<OfferListModel> offers = [];
  OfferListCubit(this.offerListWeb) : super(OfferListInitial());

  Future<void> cubitOfferList() async {
    emit(OfferListLoading());
    try {
      offers = await offerListWeb.fetchOfferList();

      emit(OfferListSuccess());
    } on Exception catch (e) {
      emit(OfferListFailure(e.toString()));
    }
  }
}
