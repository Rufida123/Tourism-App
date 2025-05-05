import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/Edit%20Services/hotel%20services/edit_hotel_state.dart';
import 'package:web_dashbord/cubits/Edit%20Services/hotel%20services/edit_hotel_web.dart';

class EditHotelCubit extends Cubit<EditHotelState> {
  final EditHotelWeb addHotelWeb;
  static EditHotelCubit get(context) => BlocProvider.of(context);
  EditHotelCubit(this.addHotelWeb) : super(EditHotelInitial());

  Future<void> cubitEditHotel(
      final String? name,
      final String? email,
      final String? phone,
      final String? location,
      final String? priceforNight,
      String hotelId) async {
    emit(EditHotelLoading());
    try {
      print("trying cubit");
      await addHotelWeb.fetchEditHotel(
          name, email, phone, location, priceforNight, hotelId);

      emit(EditHotelSuccess());
    } on Exception catch (e) {
      emit(EditHotelFailure(e.toString()));
    }
  }
}
