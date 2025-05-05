import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Trips%20Services/edit_trip_state.dart';
import 'package:web_dashbord/cubits/Edit%20Services/Trips%20Services/edut_trip_web.dart';

class EditTripOutDetailsCubit extends Cubit<EditTripDetailsState> {
  final EditTripOutDetailsWeb addTripDetailsWeb;
  static EditTripOutDetailsCubit get(context) => BlocProvider.of(context);
  EditTripOutDetailsCubit(this.addTripDetailsWeb)
      : super(EditTripOutDetailsInitial());

  Future<void> cubitEditTripOutDetails(
      final String name,
      final String phone,
      final String email,
      final String location,
      final String price,
      final String tripType,
      final String maximumParticipants,
      final String startDate,
      final String endDate,
      String tripId) async {
    emit(EditTripOutDetailsLoading());
    try {
      print("trying cubit");
      await addTripDetailsWeb.fetchEditTripOutDetails(
          name,
          phone,
          email,
          location,
          price,
          tripType,
          maximumParticipants,
          startDate,
          endDate,
          tripId);

      emit(EditTripOutDetailsSuccess());
    } on Exception catch (e) {
      emit(EditTripOutDetailsFailure(e.toString()));
    }
  }
}

class EditTripInDetailsCubit extends Cubit<EditTripDetailsState> {
  final EditTripInDetailsWeb addTripInDetailsWeb;
  static EditTripInDetailsCubit get(context) => BlocProvider.of(context);
  EditTripInDetailsCubit(this.addTripInDetailsWeb)
      : super(EditTripInDetailsInitial());

  Future<void> cubitEditTripInDetails(
      final String name,
      final String location,
      final String maximumParticipants,
      final String startDate,
      final String endDate,
      final String descriptionDetailtrip,
      final String startAgeFormDetailtrip,
      final String durationDetailtrip,
      final String tripId) async {
    emit(EditTripInDetailsLoading());
    try {
      print("trying booking cubit");
      await addTripInDetailsWeb.fetchEditTripInDetails(
          name,
          location,
          maximumParticipants,
          startDate,
          endDate,
          descriptionDetailtrip,
          startAgeFormDetailtrip,
          durationDetailtrip,
          tripId);

      emit(EditTripInDetailsSuccess());
    } on Exception catch (e) {
      emit(EditTripInDetailsFailure(e.toString()));
    }
  }
}

class EditTripActivityDetailsCubit extends Cubit<EditTripDetailsState> {
  final EditTripActivityDetailsWeb addTripActivityDetailsWeb;
  static EditTripActivityDetailsCubit get(context) => BlocProvider.of(context);
  int? addingResponse;
  EditTripActivityDetailsCubit(this.addTripActivityDetailsWeb)
      : super(EditTripActivityDetailsInitial());

  Future<void> cubitAddTripActivityDetails(
    final String name,
    final String tripId,
  ) async {
    emit(EditTripActivityDetailsLoading());
    try {
      print("trying booking cubit");

      await addTripActivityDetailsWeb.fetchEditTripActivityDetails(
          name, tripId);

      emit(EditTripActivityDetailsSuccess());
    } on Exception catch (e) {
      emit(EditTripActivityDetailsFailure(e.toString()));
    }
  }
}
