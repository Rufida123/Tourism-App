import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_dashbord/cubits/add_services/add_trip/add_trip_state.dart';
import 'package:web_dashbord/cubits/add_services/add_trip/add_trip_web.dart';

class AddTripOutDetailsCubit extends Cubit<AddTripDetailsState> {
  final AddTripOutDetailsWeb addTripDetailsWeb;
  static AddTripOutDetailsCubit get(context) => BlocProvider.of(context);
  int? addingResponse;
  AddTripOutDetailsCubit(this.addTripDetailsWeb)
      : super(AddTripOutDetailsInitial());

  Future<void> cubitAddTripOutDetails(
      final String name,
      final String phone,
      final String email,
      final String location,
      final String price,
      final String tripType,
      final String maximumParticipants,
      final String startDate,
      final String endDate) async {
    emit(AddTripOutDetailsLoading());
    try {
      print("trying booking cubit");
      addingResponse = await addTripDetailsWeb.fetchAddTripOutDetails(
          name,
          phone,
          email,
          location,
          price,
          tripType,
          maximumParticipants,
          startDate,
          endDate);

      emit(AddTripOutDetailsSuccess());
    } on Exception catch (e) {
      emit(AddTripOutDetailsFailure(e.toString()));
    }
  }
}

class AddTripInDetailsCubit extends Cubit<AddTripDetailsState> {
  final AddTripInDetailsWeb addTripInDetailsWeb;
  static AddTripInDetailsCubit get(context) => BlocProvider.of(context);
  AddTripInDetailsCubit(this.addTripInDetailsWeb)
      : super(AddTripInDetailsInitial());

  Future<void> cubitAddTripInDetails(
      final String name,
      final String location,
      final String maximumParticipants,
      final String startDate,
      final String endDate,
      final String descriptionDetailtrip,
      final String startAgeFormDetailtrip,
      final String durationDetailtrip,
      final String tripId) async {
    emit(AddTripInDetailsLoading());
    try {
      print("trying booking cubit");
      await addTripInDetailsWeb.fetchAddTripInDetails(
          name,
          location,
          maximumParticipants,
          startDate,
          endDate,
          descriptionDetailtrip,
          startAgeFormDetailtrip,
          durationDetailtrip,
          tripId);

      emit(AddTripInDetailsSuccess());
    } on Exception catch (e) {
      emit(AddTripInDetailsFailure(e.toString()));
    }
  }
}

class AddTripActivityDetailsCubit extends Cubit<AddTripDetailsState> {
  final AddTripActivityDetailsWeb addTripActivityDetailsWeb;
  static AddTripActivityDetailsCubit get(context) => BlocProvider.of(context);
  int? addingResponse;
  AddTripActivityDetailsCubit(this.addTripActivityDetailsWeb)
      : super(AddTripActivityDetailsInitial());

  Future<void> cubitAddTripActivityDetails(
    final String name,
    final String tripId,
  ) async {
    emit(AddTripActivityDetailsLoading());
    try {
      print("trying booking cubit");

      await addTripActivityDetailsWeb.fetchAddTripActivityDetails(name, tripId);

      emit(AddTripActivityDetailsSuccess());
    } on Exception catch (e) {
      emit(AddTripActivityDetailsFailure(e.toString()));
    }
  }
}
