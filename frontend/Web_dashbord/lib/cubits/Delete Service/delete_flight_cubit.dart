import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_flght_web.dart';
import 'package:web_dashbord/cubits/Delete%20Service/delete_flight_state.dart';

class DeleteFlightOutDetailsCubit extends Cubit<DeleteFlightDetailsState> {
  final DeleteFlightOutDetailsWeb addTripDetailsWeb;
  static DeleteFlightOutDetailsCubit get(context) => BlocProvider.of(context);

  DeleteFlightOutDetailsCubit(this.addTripDetailsWeb)
      : super(DeleteFlightOutDetailsInitial());

  Future<void> cubitDeleteTripOutDetails(final String tripId) async {
    emit(DeleteFlightOutDetailsLoading());
    try {
      print("trying booking cubit");
      await addTripDetailsWeb.fetchDeleteFlightOutDetails(tripId);

      emit(DeleteFlightOutDetailsSuccess());
    } on Exception catch (e) {
      emit(DeleteFlightOutDetailsFailure(e.toString()));
    }
  }
}
