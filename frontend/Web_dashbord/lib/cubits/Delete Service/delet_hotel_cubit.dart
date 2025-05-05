import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_hotel_state.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_hotel_web.dart';

class DeleteHotelOutDetailsCubit extends Cubit<DeleteHotelDetailsState> {
  final DeleteHotelOutDetailsWeb addTripDetailsWeb;
  static DeleteHotelOutDetailsCubit get(context) => BlocProvider.of(context);

  DeleteHotelOutDetailsCubit(this.addTripDetailsWeb)
      : super(DeleteHotelOutDetailsInitial());

  Future<void> cubitDeleteTripOutDetails(final String tripId) async {
    emit(DeleteHotelOutDetailsLoading());
    try {
      print("trying booking cubit");
      await addTripDetailsWeb.fetchDeleteHotelOutDetails(tripId);

      emit(DeleteHotelOutDetailsSuccess());
    } on Exception catch (e) {
      emit(DeleteHotelOutDetailsFailure(e.toString()));
    }
  }
}
