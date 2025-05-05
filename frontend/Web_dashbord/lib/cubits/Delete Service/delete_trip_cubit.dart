import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_trip_state.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_trip_web.dart';

class DeleteTripOutDetailsCubit extends Cubit<DeleteTripDetailsState> {
  final DeleteTripOutDetailsWeb addTripDetailsWeb;
  static DeleteTripOutDetailsCubit get(context) => BlocProvider.of(context);

  DeleteTripOutDetailsCubit(this.addTripDetailsWeb)
      : super(DeleteTripOutDetailsInitial());

  Future<void> cubitDeleteTripOutDetails(final String tripId) async {
    emit(DeleteTripOutDetailsLoading());
    try {
      print("trying booking cubit");
      await addTripDetailsWeb.fetchDeleteTripOutDetails(tripId);

      emit(DeleteTripOutDetailsSuccess());
    } on Exception catch (e) {
      emit(DeleteTripOutDetailsFailure(e.toString()));
    }
  }
}
