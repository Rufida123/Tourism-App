import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_hotel_state.dart';
import 'package:web_dashbord/cubits/add_services/add_hotel/add_hotel_web.dart';

class AddHotelCubit extends Cubit<AddHotelState> {
  final AddHotelWeb addHotelWeb;
  int? response;
  static AddHotelCubit get(context) => BlocProvider.of(context);
  AddHotelCubit(this.addHotelWeb) : super(AddHotelInitial());

  Future<void> cubitAddHotel(
    final String? name,
    final String? email,
    final String? phone,
    final String? location,
    final String? priceforNight,
  ) async {
    emit(AddHotelLoading());
    try {
      print("trying cubit");
      response = await addHotelWeb.fetchAddHotel(
        name,
        email,
        phone,
        location,
        priceforNight,
      );

      emit(AddHotelSuccess());
    } on Exception catch (e) {
      emit(AddHotelFailure(e.toString()));
    }
  }
}
